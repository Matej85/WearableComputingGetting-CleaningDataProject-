### run%analysis.R tides and cleans raw data and creates a dataset "tidy_data_avg" with below -requested:  
* grouped by Activity and Subject  
* only calculated variables for "mean()" and "std()"  
* average value  

### in more details, the tidy_data_avg consists of variables:  
* activity - STANDING/SITTING/LAYING/WALKING/WALKING DOWN/WALKING UP (activity during the research)  
* subject  - 1:30 (subject ID of the experiment)  
* requested variables in coded format using a separator "." column no.3-68, e.g. mean.time.gyro.body.TRUE.FALSE.Z  
* format:  
  
	
### calculated average value in unit:  
* for "acc" in standard gravity units 'g'  
* "gyro" in radians  


### All variable colnames in actual order:  
-----------------------------------------  
1                                activity  
2                                 subject  
3   mean.frequency.acc.body.FALSE.FALSE.X  
4   mean.frequency.acc.body.FALSE.FALSE.Y  
5   mean.frequency.acc.body.FALSE.FALSE.Z  
6   mean.frequency.acc.body.FALSE.TRUE.NA  
7    mean.frequency.acc.body.TRUE.FALSE.X  
8    mean.frequency.acc.body.TRUE.FALSE.Y  
9    mean.frequency.acc.body.TRUE.FALSE.Z  
10   mean.frequency.acc.body.TRUE.TRUE.NA  
11 mean.frequency.gyro.body.FALSE.FALSE.X  
12 mean.frequency.gyro.body.FALSE.FALSE.Y  
13 mean.frequency.gyro.body.FALSE.FALSE.Z  
14 mean.frequency.gyro.body.FALSE.TRUE.NA  
15  mean.frequency.gyro.body.TRUE.TRUE.NA  
16       mean.time.acc.body.FALSE.FALSE.X  
17       mean.time.acc.body.FALSE.FALSE.Y  
18       mean.time.acc.body.FALSE.FALSE.Z  
19       mean.time.acc.body.FALSE.TRUE.NA  
20        mean.time.acc.body.TRUE.FALSE.X  
21        mean.time.acc.body.TRUE.FALSE.Y  
22        mean.time.acc.body.TRUE.FALSE.Z  
23        mean.time.acc.body.TRUE.TRUE.NA  
24    mean.time.acc.gravity.FALSE.FALSE.X  
25    mean.time.acc.gravity.FALSE.FALSE.Y  
26    mean.time.acc.gravity.FALSE.FALSE.Z  
27    mean.time.acc.gravity.FALSE.TRUE.NA  
28      mean.time.gyro.body.FALSE.FALSE.X  
29      mean.time.gyro.body.FALSE.FALSE.Y  
30      mean.time.gyro.body.FALSE.FALSE.Z  
31      mean.time.gyro.body.FALSE.TRUE.NA  
32       mean.time.gyro.body.TRUE.FALSE.X  
33       mean.time.gyro.body.TRUE.FALSE.Y  
34       mean.time.gyro.body.TRUE.FALSE.Z  
35       mean.time.gyro.body.TRUE.TRUE.NA  
36   std.frequency.acc.body.FALSE.FALSE.X  
37   std.frequency.acc.body.FALSE.FALSE.Y  
38   std.frequency.acc.body.FALSE.FALSE.Z  
39   std.frequency.acc.body.FALSE.TRUE.NA  
40    std.frequency.acc.body.TRUE.FALSE.X  
41    std.frequency.acc.body.TRUE.FALSE.Y  
42    std.frequency.acc.body.TRUE.FALSE.Z  
43    std.frequency.acc.body.TRUE.TRUE.NA  
44  std.frequency.gyro.body.FALSE.FALSE.X  
45  std.frequency.gyro.body.FALSE.FALSE.Y  
46  std.frequency.gyro.body.FALSE.FALSE.Z  
47  std.frequency.gyro.body.FALSE.TRUE.NA  
48   std.frequency.gyro.body.TRUE.TRUE.NA  
49        std.time.acc.body.FALSE.FALSE.X  
50        std.time.acc.body.FALSE.FALSE.Y  
51        std.time.acc.body.FALSE.FALSE.Z  
52        std.time.acc.body.FALSE.TRUE.NA  
53         std.time.acc.body.TRUE.FALSE.X  
54         std.time.acc.body.TRUE.FALSE.Y  
55         std.time.acc.body.TRUE.FALSE.Z  
56         std.time.acc.body.TRUE.TRUE.NA  
57     std.time.acc.gravity.FALSE.FALSE.X  
58     std.time.acc.gravity.FALSE.FALSE.Y  
59     std.time.acc.gravity.FALSE.FALSE.Z  
60     std.time.acc.gravity.FALSE.TRUE.NA  
61       std.time.gyro.body.FALSE.FALSE.X  
62       std.time.gyro.body.FALSE.FALSE.Y  
63       std.time.gyro.body.FALSE.FALSE.Z  
64       std.time.gyro.body.FALSE.TRUE.NA  
65        std.time.gyro.body.TRUE.FALSE.X  
66        std.time.gyro.body.TRUE.FALSE.Y  
67        std.time.gyro.body.TRUE.FALSE.Z  
68        std.time.gyro.body.TRUE.TRUE.NA  
