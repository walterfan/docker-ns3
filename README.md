# docker-ns3

A Docker container for the NS-3 Network Simulator

Change from Ryan Kurte's image for webrtc ns

## Usage

```docker run --rm -it -v `pwd`:/work walterfan/docker-ns3```

### GUI support on OSX:

1. Install XQuartz
2. Find IP with `ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`
3. Enable IP based access with `xhost + $IP`
4. Run with  ```docker run --rm -it -v `pwd`:/work -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix walterfan/docker-ns3```

For more information check out [fredrikaverpil.github.io](https://fredrikaverpil.github.io/2016/07/31/docker-for-mac-and-gui-applications/).
