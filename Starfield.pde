Particle[] data = new Particle[1000];
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
	background(0);
	for (int i = 0; i < data.length; i++)
	{
		data[i].move();
		data[i].show();
	}
}
class NormalParticle implements Particle
{
	double myX, myY, myAngle, mySpeed;
	color myColor;
	NormalParticle()
	{
		myX = width / 2;
		myY = height / 2;
		myAngle = Math.random() * 2 * PI;
		mySpeed = 5;
	}
	void move()
	{
		myX += Math.cos(myAngle) * mySpeed;
		myY += Math.sin(myAngle) * mySpeed;
	}
	void show()
	{
		fill(255);
		ellipse((int)myX, (int)myY, 10, 10);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

