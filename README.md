# VerneMQ 2.1.1 Docker Image (Apache 2.0 Licensed)

This repository provides a Docker image for **[VerneMQ](https://vernemq.com)** version `2.1.1`, fully built **from source** using the [Apache 2.0 licensed code](https://github.com/vernemq/vernemq).  
Unlike the official pre-built binaries (which are **EULA-licensed and restricted for commercial use**), this image contains **no proprietary binaries** and is completely open-source.

---

## Features

- Built from the VerneMQ `2.1.1` source code
- Erlang/OTP `27.3.3` compiled from source using [`kerl`](https://github.com/kerl/kerl) (MIT License)
- Based on **Debian Trixie (slim)** for a small, secure runtime footprint
- Includes VerneMQ `LICENSE.txt` for transparency
- Suitable for both development and production under Apache 2.0 terms

---

## Quick Start

Pull and run:

```bash
docker pull patelneerajme/vernemq
docker run -d --name vernemq -p 1883:1883 patelneerajme/vernemq
````

---

## Disclaimer

⚠️ This image is **built entirely from open-source components**.
The VerneMQ source code (tag `2.1.1`) is licensed under [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0).
While official VerneMQ binaries are EULA-restricted, this image contains **no such binaries**.
You are free to use, distribute, and modify this image as long as you comply with the terms of Apache 2.0.

---

## Licenses & Attribution

* This Docker image and its components are licensed under [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).
* **VerneMQ 2.1.1** — Apache 2.0
  `LICENSE.txt` from VerneMQ is included in the image.
  [https://vernemq.com](https://vernemq.com)
* **Erlang/OTP** — Apache 2.0
  Built from source. No separate NOTICE file is included.
  [https://www.erlang.org](https://www.erlang.org)
* **kerl** — MIT License
  Used only as a build tool in the builder stage. Not present in the runtime image.
  [https://github.com/kerl/kerl](https://github.com/kerl/kerl)
* This repository is licensed under the [Apache License 2.0](LICENSE).

---

## Build Instructions

Clone this repository and build locally:

```bash
git clone https://github.com/patelneeraj/vernemq-apache2-docker.git
cd vernemq-apache2-docker
docker build -t vernemq-apache2-docker .
```

---

## Contributing

Contributions are welcome!
Feel free to open issues or pull requests to improve this image.

---

## Security Notes

* Built on `debian:trixie-slim` for reduced attack surface.
* APT caches and temporary build files are removed to keep the image lean.
* Only runtime dependencies are shipped in the final image.
