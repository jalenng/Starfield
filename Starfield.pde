Particle[] data = new Particle[10];
PImage[] images = new PImage[5];
void setup()
{
	size(300, 300);
	for (int i = 0; i < data.length; i++)
	{
		data[i] = new NormalParticle();
	}
	for (int i = 0; i < images.length; i++)
	{
		images[i] = loadImage((String)("images/" + "cloud[" + i + "].png"));
	}
}
void draw()
{
	background(192, 224, 235);
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
		mySpeed = Math.random() * 0.1;
		mySize = 1;
		myFilename = (String)("images/" + "cloud[" + (int)(Math.random() * 5) + "].png");
		myPhotoIndex = (int)(Math.random() * images.length);
	}
	void move()
	{
		myX += Math.cos(myAngle) * mySpeed;
		myY += Math.sin(myAngle) * mySpeed;
	}
	void show()
	{
		noStroke();
		for (int i = 0; i < data.length; i++)
		{
			image(images[myPhotoIndex], 
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
			mySpeed = Math.random() * 0.1;
			mySize = 1;
			myFilename = (String)("images/" + "cloud[" + (int)(Math.random() * 5) + "].png");
			myPhotoIndex = (int)(Math.random() * images.length);
		}
		mySpeed *= 1.02;
		mySize = myDistanceFromCenter * 2;
		myDistanceFromCenter = sqrt(sq((float) myX - (width / 2)) + sq((float) myX - (height / 2)));
	}
}
interface Particle
{
	public void move();
	public void show();
	public void update();
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}