#Mars rovers
**Technical challenge in Ruby and RSpec**

###Objectives
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on­board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading. Assume that the square directly North from (x, y) is (x, y+1).

####Input

The first line of input is the upper­right coordinates of the plateau, the lower­left coordinates are assumed to be 0,0. The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau. The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co­ordinates and the rover’s orientation.Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.

**Test Input**

```shell
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```

####Output

The output for each rover should be its final co­ordinates and heading.

**Expected Output:**

```
1 3 N
5 1 E
```

---

###Status - working

I built the model using four main classes: **MissionControl**, **Rover**, **Surface** and **Square**.

Starting with the simplest, **Square** currently does nothing, but was created to enable the later addition of exploration. **Surface** holds a grid of Squares. **Rover** has a position (x, y and orientation), and can rotate and move in the direction it's facing.

**MissionControl** does the hard work, processing the input file and sending the commands through to each Rover. The way I designed the methods makes it simple to add more rovers simply by adding more lines to the input file.

**Still to do...**

- Extend Rover to mark each square as explored when it gets to it, and extend Surface to display the full grid in the terminal at any stage of the mission.
- Refactor
- Create a method to run it without irb

---

###How to run

```shell
git clone https://github.com/Bayonnaise/mars-rovers.git
cd mars-rovers
irb
require './lib/mission_control.rb'
MissionControl.new.run_mission_from 'test_input'
```

###How to run tests

```shell
git clone https://github.com/Bayonnaise/mars-rovers.git
cd mars-rovers
rspec
```
