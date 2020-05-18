/*
Declare as many services as you need
for your machine */

bind_address = "192.168.137.25"
collision_avoidance = "hostname"
announce_time=5

service {
    name = "Dopi"
    host_name = "dopi.local."
    type = "_dopi-server-telnet._tcp"
    domain = "local."
    port = 23
    ttl = 300
}

