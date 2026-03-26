*/Amaxon linux */

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.33.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops
echo "export PATH=$PATH:/usr/local/bin/" >> source .bashrc


export KOPS_STATE_STORE=s3://ritesh.k8s.local


kops create cluster --name ritesh.k8s.local --zones ap-south-1a --control-plane-image ami-05d2d839d4f73aafb  --control-plane-count=1 --control-plane-size c7i-flex.large --image ami-05d2d839d4f73aafb  --node-count=2 --node-size c7i-flex.large

TO DELETE: kops delete cluster --name ritesh.k8s.local --yes
