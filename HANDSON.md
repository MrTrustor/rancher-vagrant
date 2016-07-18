# Hands On Rancher

## Cattle demo

To create a Rancher/Cattle environment, follow those instructions:

```bash
make up-server
make up-rancher
```

This will create one rancher server, accessible on http://192.168.33.11:8080, and 3 cattle nodes.

### Creating an ElasticSearch cluster
* Go to http://192.168.33.11:8080/env/1a5/catalog?catalogId=library
* Click on the "Elasticsearch" (not Elasticsearch 2.x) item, and create a stack.
* Go on the "elasticsearch" stack's page that is being created, add a new load-balancer service:
  * Click on the little arrow next to "Add Service" and choose "Add Load Balancer",
  * Give it a name,
  * In the "Listening Ports" part of the form, write "9200" for both the "Source IP/Port" and "Default Target Port",
  * Choose "elasticsearch-masters" as target service.
* Go back to the "elasticsearch" stack's page and click on the little "i" next to your load-balancer's name. When it is ready, you will get your ElasticSearch endpoint.
* On Rancher, go to the "kopf" service page and find on which IP it is listening.
* Go to Kopf to see your cluster.

### Injecting Data in the cluster
To inject test data in the ElasticSearch cluster, simply run:

```bash
docker run --rm mrtrustor/es-injection --es-url='http://my_endpoint:9200/' --num_of_replicas=2
```

* On Kopf, you will see that an index is created with some documents.
* The cluster is now yellow, because it can't allocate some replicas.
* On the "elasticsearch-datanodes" service page, scale to 3 and watch your cluster going green again.

## Rancher catalog

You can create your own catalog in Rancher.

* Create a new public git repository (Github will do),
* Copy the content of the ``rancher-catalog`` directory in your new repository, commit it and push it,
* On http://192.168.33.11:8080/admin/settings, you can add the URL (HTTP or HTTPS) for your new catalog,
* It should appear in the catalog tab,
* You can now deploy your own Wordpress (get the endpoint in the ``wp-endpoint`` service).

### Updating a catalog item

You may have seen that the Wordpress you deployed is not up to date. You can create a new version of your product in the catalog.

* In the ``templates/mtrustor-wordpress`` directory, execute ``cp -a 0 1``,
* In the ``1`` directory, change the Docker image used for wordpress and the product version,
* In the ``config.yml`` file, change the default product version,
* Commit and push,
* In Rancher, reload your catalog,
* On your wordpress stack, an "upgrade" button should appear: click it and wait for your wordpress to be upgraded.

## Multi-cluster

Rancher can manage multiple orchestration clusters at once. It can manage Cattle, Swarm, Kubernetes and Mesos clusters.
To create a Kubernetes cluster, do the following:

* In Rancher, on the "Default" tab, click on "Manage Environments",
* Add an environment with Kubernetes as orchestrator and "kubedemo" as name,
* Execute ``make up-kubernetes`` and watch your K8s cluster being provisionned,
* You can take a look at the existing catalog and see what services the community has already provided.
