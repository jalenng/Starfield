Particle[] data = new Particle[15];
PImage[] cloudImages = new PImage[5];
PImage evan;
void setup()
{
	size(500, 500);
	for (int i = 0; i < data.length; i++)
	{
		if (i != data.length - 1)
			data[i] = new NormalParticle();
		else
			data[i] = new OddballParticle();
	}
	for (int i = 0; i < cloudImages.length; i++)
	{
		cloudImages[i] = loadImage((String)("images/" + "cloud[" + i + "].png"));
	}
	evan = loadImage("images/evan.png");
}
void draw()
{
	//background(117, 184, 252);
	fill(117, 184, 252, 100);
	rect(0, 0, width, height);
	for (int i = 0; i < data.length; i++)
	{
		data[i].move();
		data[i].show();
		data[i].update();
	}
}
class NormalParticle implements Particle
{
	double myX, myY, mySpeed, mySize, myDistanceFromCenter;
	double myAngle;
	String myFilename;
	int myPhotoIndex;
	NormalParticle()
	{
		myX = width / 2;
		myY = height / 2;
		myAngle = Math.random() * 2 * PI;
		mySpeed = (Math.random() * 0.05) + 0.05;
		mySize = 0;
		myPhotoIndex = (int)(Math.random() * cloudImages.length);
	}
	void move()
	{
		myX += Math.cos(myAngle) * mySpeed;
		myY += Math.sin(myAngle) * mySpeed;
	}
	void show()
	{
		noStroke();
		fill(255, 255, 255, 10);
		ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
		for (int i = 0; i < data.length; i++)
		{
			image(cloudImages[myPhotoIndex], 
				(float)(myX - mySize / 2), 
				(float)(myY - mySize / 2), 
				(float)mySize,
				(float)mySize);
		}
	}
	void update()
	{
		if (myDistanceFromCenter > 2000){
			myX = width / 2;
			myY = height / 2;
			myAngle = Math.random() * 2 * PI;
			mySpeed = (Math.random() * 0.03) + 0.01;
			myFilename = (String)("images/" + "cloud[" + (int)(Math.random() * 5) + "].png");
			myPhotoIndex = (int)(Math.random() * cloudImages.length);
		}
		mySpeed *= 1.02;
		myDistanceFromCenter = sqrt(sq((float) myX - (width / 2)) + sq((float) myX - (height / 2)));
		mySize = myDistanceFromCenter * 2;
	}
}
interface Particle
{
	public void move();
	public void show();
	public void update();
}
class OddballParticle implements Particle
{
	double myX, myY, myRotation, mySpeed;
	OddballParticle()
	{
		myX = width / 2;
		myY = width / 2;
		mySpeed = 10;
		myRotation = 0;
	}
	void show()
	{
		translate((float)myX, (float)myY);
		rotate((float)myRotation);
		image(evan, -75, -75, 150, 150);
		resetMatrix();
	}
	void move()
	{
		myRotation += 0.05;
		//myX += mySpeed;
		//myY += mySpeed;
	}
	void update()
	{

	}
}
class JumboParticle extends OddballParticle
{
	//your code here
}