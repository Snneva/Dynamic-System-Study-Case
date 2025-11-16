# Dynamic-System-Study-Case

his repository contains a full MATLAB simulation of a DC motor dynamic system using the mathematical model from the research paper:

> **Hsiu-Ming Wu, Muhammad Qomaruz Zaman (2025)**  
> *Enhanced Hierarchical Fuzzy Formation Control with fuzzy collision avoidance behavior for multiple Mecanum wheeled Mobile Robots.*  
> Robotics and Autonomous Systems.

The model is based on the combined **electrical armature equation** and **mechanical rotational dynamics**, allowing analysis of torque, angular velocity, and back-EMF under pulse voltage input.

- Complete DC motor dynamic model:
  - Armature resistance and inductance  
  - Back-EMF voltage  
  - Torque generation  
  - Mechanical inertia and viscous friction  
- Time-domain simulation using **ODE45**  
- Pulse voltage input:
  - +5 V pulse (forward rotation)
  - −5 V pulse (reverse rotation)
- Output variables:
  - Motor torque  
  - Angular velocity  
  - Back-EMF
 
  Please Download the motor_ode.m function first before simulating the simulation. Thanks
