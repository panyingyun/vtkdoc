.PHONY: env  web

env:
	wget https://github.com/asoul-sig/asouldocs/releases/download/v1.0.0/asouldocs_1.0.0_linux_amd64.tar.gz
	tar -zxvf asouldocs_1.0.0_linux_amd64.tar.gz
	sudo mv asouldocs /usr/local/bin/asouldocs
	rm asouldocs_1.0.0_linux_amd64.tar.gz
run:
	kill -9 asouldocs
	nohup asouldocs web > vtkdoc.log &
	ps -aux | grep asouldocs
web:
	asouldocs web

docker:
	docker rm -f vtkdoc | true
	docker run --name=vtkdoc -p 15555:5555  -v $(pwd)/custom:/app/asouldocs/custom -v $(pwd)/docs:/app/asouldocs/docs unknwon/asouldocs
