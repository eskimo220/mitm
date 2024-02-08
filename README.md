# README for Dockerized mitmproxy Transparent Proxy Project

This project simplifies the deployment process for setting up a transparent proxy using mitmproxy within a Docker environment. It is designed to enable monitoring, inspection, modification, and replaying of HTTP(S) traffic for specific applications or services. The configuration covers the essentials of operating mitmproxy in transparent proxy mode, including NAT rule setup and handling mitmproxy's certificate for HTTPS traffic. The following instructions will guide you through deploying and utilizing this transparent proxy setup.

## Prerequisites

- Docker and Docker Compose installed on your machine.
- Basic understanding of Docker, networking, and proxy concepts.

## Setup Instructions

1. **Build and Run Containers**

   Use Docker Compose to build and start the containers defined in the `docker-compose.yml` file:

   ```bash
   docker-compose up --build
   ```

   This command will create a network named `mitm-net` and start three containers: `mitmproxy`, `mitmproxy-client`, and `pandora`.

2. **Configuring Transparent Proxy**

   The `mitmproxy` container is configured to run in transparent mode, with `mitmweb` serving on ports 8080 (proxy) and 8081 (web interface). The `NET_ADMIN` capability is added to allow network configurations required by the transparent proxy setup.

3. **Accessing mitmproxy Web Interface**

   You can access the mitmproxy web interface by navigating to `http://<your_machine_ip>:8081` in your web browser. This interface allows you to inspect, modify, and replay the HTTP(S) traffic passing through the proxy.

4. **Setting up NAT Rules**

   Ensure that the NAT rules are properly set up to redirect the desired traffic from your client container (`mitmproxy-client`) or other services (e.g., `pandora`) to the mitmproxy container. This might involve configuring iptables rules or adjusting Docker network settings.

5. **Downloading and Trusting the mitmproxy Certificate**

   To monitor HTTPS traffic, you'll need to download and trust mitmproxy's root CA certificate on the client devices or within the client container:

   - Access mitmproxy's web interface.
   - Navigate to the `/cert` page to download the certificate.
   - Install and trust the certificate according to your operating system's or application's instructions.

## License

MIT