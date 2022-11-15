# Assignmnet2 : Sim to Real
<p align="center"><img src="../image/8.png"></p>   

In Unity simulation, we used Opencv to recognize lines and traffic lights for Xycar autonomous driving. Can we use the simulation method in the real world as it is? Identify and solve the gap in Sim to Real.  

### **Deadline : 22.11.08 ~ 22.12.01**

## How to connect Xycar

1. Connect wifi "RAISE_project" from remote PC   
WiFi : RAISE_project  
PWD : engineers  

2. check xycar id  
  Xycar-X-10{xycar_num}-WXK  
  #Example  
  Xycar-X-10**08**-WXK  
  Xycar-X-10**10**-WXK  

3. ssh connect
<p align="center"><img src="../image/ssh.png"></p>  

```bash
$ ssh nvidia@192.168.0.{xycar_num}

# example
$ ssh nvidia@192.168.0.8
$ ssh nvidia@192.168.0.10

# ssh id : nvidia  
# Password : nvidia  

# If you connect ssh nvidia-xycar complete,
nvidia@nvidia-xycar:~$
```

## Run
``` bash
# 1
# WSL or Ubuntu
$ gedit ~/.bashrc
$ nano ~/.bashrc

# Change ~/.bashrc file ROS_MASTER_URI
# check 192.168.0.{xycar_num}
export ROS_MASTER_URI=http://192.168.0.{xycar_num}:11311
export ROS_HOSTNAME=localhost

# example
export ROS_MASTER_URI=http://192.168.10:11311 
export ROS_HOSTNAME=localhost
```

``` bash
# 2
# xycar
nvidia@nvidia-xycar:~$ roslaunch robotvision driving.launch
```
``` bash
# 3
# WSL or Ubuntu
$ rosrun assignment1 real_driving.py
```




