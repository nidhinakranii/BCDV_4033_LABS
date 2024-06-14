# Implicit dependency: Docker network
resource "docker_network" "my_network" {
  name = "my_network"
}

# Explicit dependency: Docker volume depends on the network
resource "docker_volume" "my_volume" {
  name = "my_volume"
  
  # Explicit dependency on the docker_network resource
  depends_on = [docker_network.my_network]
}

# Implicit dependency: Docker container depends on the network
resource "docker_container" "my_container" {
  image = "nginx"
  name  = "my_container"
  
  # Implicit dependency on the docker_network resource
  network_mode = docker_network.my_network.id
}
