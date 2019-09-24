# LearnModernCMake


Introduction

This repository aims at giving the information of how to use the modern cmake

Current support by the repository
- Currenly you can learn how to create the shared library and expose its interfaces
  to the users.
- How to create the <library>Config.cmake files using the cmake helper classes
- How to create the deb package for the library so that the users can simply
  install and use on their systems.

Build
mkdir build && cd build
cmake ..
make 
make package
sudo dpkg -i <package>.deb 

