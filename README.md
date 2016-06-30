# Samba file rename demonstration

## The issue

  * Mount a Samba share in Finder on OS X El Capitan (Yosemite works as expected) (CMD+K, enter the smb:// connection address)
  * Rename a file in this share via another machine, directly on the host or otherwise
  * On at least Samba 4.3 and 4.4, the rename is not propagated in Finder. What makes matters worse is that there is no refresh button, so you have to reconnect the share to see changes
  * On Samba 3.6, the rename is immediately triggering an update in Finder.

## Related Bug reports

There are a bunch of seemingly related issue reports without any solutions:

  * https://bugs.launchpad.net/ubuntu/+source/samba/+bug/1576594
  * https://discussions.apple.com/thread/7350845?start=0&tstart=0

## Supplied examples

This repo contains a minimal example public share setup to reproduce the issue in the form of Dockerfiles that build and run Samba 3.6 and 4.3 services.

The Makefile in this repo just bundles together a bunch of shell commands to avoid
copy & pasting the instructions from this README.

### Build docker image and run it

  * `make serve-3.6` - Builds a ubuntu 12.04/samba 3.6 docker image and launches it, listening on port 20036 with `./data` mounted on the public share
  * `make serve-4.3` - Builds a ubuntu 16.04/samba 4.3 docker image and launches it, listening on port 20043 with `./data` mounted on the public share

### Connect via smbclient for testing

You can get an `smbclient` shell by running `make connect-3.6` or `make connect 4.3` when
one the respective service is launched.