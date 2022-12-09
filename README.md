# Zookeeper ROCK
This repository contains the packaging metadata for creating a ROCK of Zookeeper built from the official Zookeeper release artifacts.  For more information on ROCKs, visit the [rockcraft Github](https://github.com/canonical/rockcraft). 

## Building the ROCK
The steps outlined below are based on the assumption that you are building the ROCK with the latest LTS of Ubuntu.  If you are using another version of Ubuntu or another operating system, the process may be different.

### Clone Repository
```bash
git clone git@github.com:canonical/zookeeper-rock.git
cd zookeeper-rock
```
### Installing Prerequisites
```bash
sudo snap install rockcraft --edge
sudo snap install docker
sudo snap install lxd
sudo snap install skopeo --edge --devmode
```
### Configuring Prerequisites
```bash
sudo usermod -aG docker $USER 
sudo lxd init --auto
```
*_NOTE:_* You will need to open a new shell for the group change to take effect (i.e. `su - $USER`)
### Packing and Running the ROCK
```bash
rockcraft pack
sudo skopeo --insecure-policy copy oci-archive:zookeeper*.rock docker-daemon:<username>/zookeeper:<tag>
docker run --rm -it <username>/zookeeper:<tag>
```