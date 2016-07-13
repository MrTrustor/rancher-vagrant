$boxes = [
    {
      "name"   => "rancher-server",
      "role"   => "server",
      "memory" => "1536",
      "labels" => [],
    },
    {
      "name"   => "rancher-agent",
      "count"  => 3,
      "memory" => "1024",
      "labels" => ["type=general"]
    },
    {
      "name"         => "kubernetes-agent",
      "count"        => 3,
      "memory"       => "728",
      "labels"       => ["type=general"],
      "project"      => "kubedemo",
      "project_type" => "kubernetes"
    },
]