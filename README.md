# DemoApplication

# Example Build for iMX8M Plus
docker build --build-arg IMAGE_ARCH=arm64 --build-arg GPU=-vivante --build-arg APP_ROOT=/app -t demo-app .
