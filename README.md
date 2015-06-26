oneLine
simple mathematical model testing

It is easy to visualize mathematics with Processing language, however it seems complicated to draw a simple curve with a set of equations and parameters. Like how in super developed human landscapes, finding a normal natural healthy pot of potatoes can be quite a workout! 

Content

This is an example of how to visualize curve-like equations interactively with iOS environment. 
Why? 
More playing with the visual design concept of applications. 
Exploring the possibility of application being “something else”, rather than always there ready to serve US? Maybe the relationship with me and my app is just as casual as a train ride. 

Code

  UIPanGestureRecognizer for two boxes. [pink] and [blue]
  [Timer]in blue active the mathematical drawing in time
  set the time to be smaller, therefore to have fluid motion. -> scheduledTimerWithTimeInterval: 0.1 
  standard equation for cardioid curve -> 
  float ex = r * ((2* cosf(i/M_2_PI + tempT )- cosf(2*(i/M_2_PI + tempT ))));
  
  
  
  
