.PHONY: serve-3.6 serve-4.3 connect-3.6 connect-4.3

PWD=$(shell pwd)

serve-3.6:
	docker build --pull --tag samba:3.6 -f Dockerfile-3.6 .
	docker run -it --rm --name samba-3.6 -p 20036:445 -v ${PWD}/data:/data samba:3.6

serve-4.3:
	docker build --pull --tag samba:4.3 -f Dockerfile-4.3 .
	docker run -it --rm --name samba-4.3 -p 20043:445 -v ${PWD}/data:/data samba:4.3

connect-3.6:
	smbclient -I 127.0.0.1 -p 20036 -N //LOCALHOST/public/

connect-4.3:
	smbclient -I 127.0.0.1 -p 20043 -N //LOCALHOST/public/