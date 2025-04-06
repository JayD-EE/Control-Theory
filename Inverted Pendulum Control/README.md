# Inverted Pendulum Control System

This repository contains resources for building and simulating an inverted pendulum control system from scratch. It includes everything from mathematical modeling, system dynamics, to control system design and simulation using MATLAB, Simulink, and related tools.

## Overview

Inverted pendulum systems are fundamental in control theory and robotics, widely used to understand dynamics, stability, and control design principles. The project covers:

- Deriving equations for system dynamics.
- Implementing various control techniques like LQR, pole placement, and Kalman filtering.
- Simulating the system in MATLAB and Simulink.
  
### Resources

The repository includes the following resources:

#### **Utilities**
- `cartpend.m`: System of ODEs for the inverted pendulum on a cart.
- `drawcartpend.m`: Visualizes the inverted pendulum on a cart.
- `drawcartpend_bw.m`: Visualizes the system with inverted colors.

#### **Preliminaries**
- `linearize_cartpend.m`: Tests the linearized dynamics of the system.
- `sim_cartpend.m`: Simulates nonlinear dynamics.

#### **Control and Estimator Design**
- `poleplace_cartpend.m`: Implements pole placement for a controllable system.
- `lqr_cartpend.m`: Designs an LQR full-state feedback controller.
- `obsv_cartpend.m`: Tests system observability.
- `kf_cartpend.m`: Designs a Kalman filter for full-state estimation.

#### **Simulink Implementations** (located in the "simulink_LQR_LQG" folder)
- `lqg_simulinkINIT.m`: Initializes LQR feedback gains and Kalman filter system.
- `lqr_cartpend_sim.slx`: Simulink model for LQR control.
- `lqg_cartpend_sim.slx`: Simulink model for LQG control.
- `cartpend_sim.*`: System block for the inverted pendulum on the cart.

#### **Main Code**
- `state_space_control_Main_Code`: Modified code for the application, using various resources and techniques.

## Tutorials and References

To understand the underlying mathematics and control techniques, I followed the following tutorials and resources:

- **Complete Tutorial on Inverted Pendulum Control Derivation**:  
  [YouTube Tutorial](https://www.youtube.com/watch?v=c3z4eo6s0Ek&pp=ygUbaW52ZXJ0ZWQgcGVuZHVsdW0gbW9kZWxsaW5n)

- **Steve Brunton's Control Bootcamp Playlist** (for simulation tutorials):  
  [YouTube Playlist](https://www.youtube.com/playlist?list=PLeVTKT_owiH3NfAMEOmI5_lSnWthVoTM0)

- **Collaborative Educational Resources** (from University of Michigan, Carnegie Mellon University, and University of Detroit Mercy):  
  [CTMS - Inverted Pendulum Model](https://ctms.engin.umich.edu/CTMS/index.php?example=InvertedPendulum&section=SystemModeling)

These resources were extremely helpful in understanding the system's dynamics, implementing controllers, and simulating the system in MATLAB and Simulink.

## Disclaimer

You are free to use and modify this code for your personal learning. I have customized the code from these resources to suit my project. Enjoy experimenting and learning! :)

## Contact

If you encounter any issues or need assistance with this project, feel free to reach out to me on my LinkedIn:  
[LinkedIn Profile](https://www.linkedin.com/in/junaid-10j/)
