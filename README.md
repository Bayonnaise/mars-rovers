#Mars rovers [![Code Climate](https://codeclimate.com/github/Bayonnaise/mars-rovers/badges/gpa.svg)](https://codeclimate.com/github/Bayonnaise/mars-rovers) [![Test Coverage](https://codeclimate.com/github/Bayonnaise/mars-rovers/badges/coverage.svg)](https://codeclimate.com/github/Bayonnaise/mars-rovers)
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

###Development

I built the model using four classes to try to keep to SRP: **MissionControl**, **Rover**, **Surface** and **Square**.

- **Square** simply knows whether it's been explored yet.
- **Surface** holds and displays a grid of Squares, and tracks the exploration percentage. To display the grid correctly I had to use Ruby's transpose method.
- **Rover** has a position (x, y and orientation), and can rotate and move in the direction it's facing.
- **MissionControl** does the hard work, processing the input file and sending the commands through to each Rover.

**Extendability**

The code was designed to be easily extendable. MissionControl holds an array of rovers, so additional rovers can be added and controlled simply by adding more pairs of lines to the input file.

You can test this by specifying a different input file when you run the program.

**Example output**

```shell
1 3 N
5 1 E

. . . . . . 
. . . . . . 
. x . x x x 
x x . . . x 
x x . . x x 
. . . . . . 

Explored: 31%
```

---

###How to run

```shell
git clone https://github.com/Bayonnaise/mars-rovers.git
cd mars-rovers
ruby lib/launch_mission.rb test_input
```

###How to run tests

```shell
git clone https://github.com/Bayonnaise/mars-rovers.git
cd mars-rovers
rspec
```
