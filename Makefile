resume: resume-server resume-rancher resume-kubernetes

resume-server:
	@vagrant resume rancher-server-01

resume-rancher:
	@vagrant resume rancher-agent-01 rancher-agent-02 rancher-agent-03

resume-kubernetes:
	@vagrant resume kubernetes-agent-01 kubernetes-agent-02 kubernetes-agent-03

up: up-server up-rancher up-kubernetes

up-server:
	@vagrant up rancher-server-01

up-rancher:
	@vagrant up rancher-agent-01 rancher-agent-02 rancher-agent-03

up-kubernetes:
	@vagrant up kubernetes-agent-01 kubernetes-agent-02 kubernetes-agent-03

destroy: destroy-server destroy-rancher destroy-kubernetes

destroy-server:
	@vagrant destroy rancher-server-01

destroy-rancher:
	@vagrant destroy rancher-agent-01 rancher-agent-02 rancher-agent-03

destroy-kubernetes:
	@vagrant destroy kubernetes-agent-01 kubernetes-agent-02 kubernetes-agent-03

suspend: suspend-server suspend-rancher suspend-kubernetes

suspend-server:
	@vagrant suspend rancher-server-01

suspend-rancher:
	@vagrant suspend rancher-agent-01 rancher-agent-02 rancher-agent-03

suspend-kubernetes:
	@vagrant suspend kubernetes-agent-01 kubernetes-agent-02 kubernetes-agent-03
