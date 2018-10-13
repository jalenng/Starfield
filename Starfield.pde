Particle[] data = new Particle[50];
PImage[] cloudImages = new PImage[5];
PImage evan, connor;

void setup()
{
	size(500, 500);
	for (int i = 0; i < data.length; i++)
	{
		if (i < data.length - 2)
			data[i] = new NormalParticle();
		else if (i == data.length - 1)
			data[i] = new OddballParticle();
		else			
			data[i] = new JumboParticle();
	}
	for (int i = 0; i < cloudImages.length; i++)
	{
		cloudImages[i] = loadImage((String)("images/" + "cloud[" + i + "].png"));
	}
	evan = loadImage("images/evan.png");
	connor = loadImage("images/connor.png");
}

void draw()
{
	//background(117, 184, 252);
	fill(117, 184, 252, 100);
	rect(0, 0, width, height);
	for (int i = 0; i < data.length; i++)
	{
		data[i].update();
		data[i].move();
		data[i].show();
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
		mySpeed = (Math.random() * 0.0) + 0.05;
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
		fill(255, 255, 255, 5);
		ellipse((float)myX, (float)myY, (float)mySize * 1.5, (float)mySize * 1.5);
		image(cloudImages[myPhotoIndex], 
			(float)(myX - mySize / 2), 
			(float)(myY - mySize / 2), 
			(float)mySize,
			(float)mySize);
	}
	void update()
	{
		if (myDistanceFromCenter > 3000){
			myX = width / 2;
			myY = height / 2;
			myAngle = Math.random() * 2 * PI;
			mySpeed = (Math.random() * 0.5) + 0.0001;
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
	double myX, myY, myRotation, myAngle;
	OddballParticle()
	{
		myRotation = 0;
		myAngle = 0;
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
		myX = (width / 2) + (Math.cos(myAngle) * 125);
		myY = (height / 2) + (Math.sin(myAngle) * 125);
	}
	void update()
	{
		myRotation += 0.005 * Math.sin(myAngle * 3);
		myAngle += 0.005;
	}
}

class JumboParticle extends OddballParticle
{
	JumboParticle()
	{
		myRotation = PI;
		myAngle = PI;
	}
	void show()
	{
		translate((float)myX, (float)myY);
		rotate((float)myRotation);
		image(connor, -75, -75, 150, 150);
		resetMatrix();
	}
}