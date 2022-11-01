# RobotVision_xycar

## Robot Vision System - xycar
이 실습자료는 한양대학교 ERICA 로봇비전시스템, 비전시스템설계 교육 목적으로 제작 되었습니다. 로봇비전시스템은 로봇을 이용한 머신 비전 시스템으로 다양한 로봇 Task를 수행하는 고속/고정밀도, 실시간 시각 센서 시스템입니다.  Xytron 사의 Xycar-X 모델을 이용하여 자율주행자동차 로봇비전시스템을 학습합니다.  
실습 설치 및 문제 발생 시 담당 조교 최찬역(angledsugar@hanyang.ac.kr) 문의 바랍니다.  

## Installation
Nvidia AGX Xavier installed in Xycar is called Single-board computer (SBC). Your Computer is called PC. Data from many sensor installed in Xycar sent to the SBC. If you want see sensor data, you do connect your PC to SBC.  Nvidia AGX Xavier OS is Jetpack 4.2.3 & ROS1 Melodic. 
Recommend PC OS is Ubuntu 18.04 & Windows10 or 11.

### Windows Subsystem For Linux 2 (WSL2) 설치 
=> https://learn.microsoft.com/ko-kr/windows/wsl/install  

Install Xming X Server for Windows (https://sourceforge.net/projects/xming/)  
*Warning* : Xming 설치 시 개인, 공용 네트워크 설정 모두 체크  

Open "Windows Power shell"  
PS> wsl --install  
PS> wsl --install -d Ubuntu-18.04  
PS> wsl  

### ROS melodic 설치
http://wiki.ros.org/melodic/Installation/Ubuntu  
$ sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'  
$ sudo apt install curl  
$ curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -  
$ sudo apt update  
$ sudo apt install ros-melodic-desktop  
$ echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc  
$ source ~/.bashrc  
$ sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential  
$ sudo apt install python-rosdep  
$ sudo rosdep init  
$ rosdep update  
$ mkdir -p ~/catkin_ws/src  
$ cd ~/xycar_ws/  
$ catkin_make  
$ echo "source ~/xycar_ws/devel/setup.bash" >> ~/.bashrc  
$ echo "export ROS_MASTER_URI=http://localhost:11311 " >> ~/.bashrc  
$ echo "export ROS_HOSTNAME=localhost " >> ~/.bashrc  
$ source ~/.bashrc  

### 주행 시뮬레이터 의존 패키지 설치
$ cd ~/xycar_ws/src  
$ sudo apt update && sudo apt upgrade -y  
$ sudo apt install ros-melodic-rosbridge-server  
$ git clone https://github.com/Angledsugar/RobotVision_xycar.git  
$ cd ~/xycar_ws && catkin_make  

### 실행 방법
Check eth0: intet 000.000.000.000
```bash
# Ubuntu  
$ ifconfig  
# Windows
PS > wsl hostname -I
```     
```bash
# Terminal 1  
$ roslaunch rosbridge_server rosbridge_websocket.launch
```  
```bash  
# Terminal 2
# Unity is on, Input Ubuntu(WSL2) IP => "ws://{000.000.000.000}:9090" and Press "Enter"
$ ~/xycar_ws/src/RobotVision_xycar/Build/Linux/Start/RVS_start.x86_64 # Ubuntu 
PS > ~/xycar_ws/src/RobotVision_xycar/Build/Windows/Start/RVS_start.exe  # Windows

```
```bash  
# Terminal 3
$ ~/xycar_ws/src/RobotVision_xycar/Build/Linux/Xycar/RVS.x86_64 # Ubuntu
PS > ~/xycar_ws/src/RobotVision_xycar/Build/Windows/Xycar/RVS.exe  # Windows
```

```bash
# Terminal 4  
$ roslaunch assignment driving.launch   
```

# Assignment1 : OpenCV로 차선, 신호등 인식하기
First class : 22.10.18  
Deadline : 22.10.18 ~ 11.08  
Check "xycar_opencv.zip"  
[1] Image Read  
Image : OpenCV-ImageRead.png  
Line >> img = cv2.line(img, (0,0), (511, 511), (255, 0, 0), 5)  
Rectangle >> img = cv2.rectangle(img, (100,100), (300,500), (0,255,0), 3)  
Circle >> img  = cv2.circle(img, (300,400), 100, (0,0,255), 2)  
Text >> cv2.putText(img, 'Test', (10,50), cv2.FONT_HERSHEY_SIMPLEX, 4, (255,255))  
Image file read >> img = cv2.imread('picture.jpg', cv2.IMREAD_GRAYSCALE)   
Image show >> cv2.imshow('Color', img)   
Image save >> cv2.imwrite('new_image.jpg', img)   
[2] Gray Scale  
[3] Gaussian Blur  
[4] HSV -Binary  
[5] ROI  

# Assignmnet2 : Deep learning(R-CNN, Fast, Faster, SSD, YOLO)로 차선, 신호등 인식하기  
Second class : 22.10.18  
Third class : 22.11.29  
Deadline : 22.11.08 ~ 11.29  
데이터셋  
(0) Coco dataset  
(1) 실제 신호등 데이터 셋 (https://www.aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=188)  
(2) Xycar 신호등 (직접 제작)  
실습 코드 : https://teachablemachine.withgoogle.com/   
