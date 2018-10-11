Particle[] data = new Particle[100];
void setup()
{
	size(300, 300);
	for (int i = 0; i < data.length; i++)
	{
		data[i] = new NormalParticle();
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
	double myX, myY, myAngle, mySpeed, mySize;
	int[] myCircles;
	color myColor;
	NormalParticle()
	{
		myX = width / 2;
		myY = height / 2;
		myAngle = Math.random() * 2 * PI;
		mySpeed = Math.random() * 3;
		mySize = 0.01;
		myCircles = new int[2];
		for (int i = 0; i < myCircles.length; i += 2)
		{
		}
	}
	void move()
	{
		myX += Math.cos(myAngle) * mySpeed;
		myY += Math.sin(myAngle) * mySpeed;
	}
	void show()
	{
		noStroke();
		fill(255, 255, 255, 100);
		for (int i = 0; i < myCircles.length; i += 2)
		{
			ellipse((int)(myCircles[i]), (int)(myCircles[i] + 1), (int)mySize, (int)mySize);
		}
	}
	void update()
	{
		mySpeed *= 1.01;
		mySize += 0.75;
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

