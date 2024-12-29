git pull --rebase || true
docker rm -f vtkdoc || true
docker build -t vtkdoc:latest .
docker run -itd --restart=always  -p 5555:5555 --name vtkdoc vtkdoc:latest
docker ps 
