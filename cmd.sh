function clear_dangling_images(){
    docker rmi $(docker images -f "dangling=true" -q) -f
}

function build(){
    # Load dockerfile from dockerfiles folder and build
    for dockerfile in $(ls dockerfiles/Dockerfile.*); do
        # if [ "$dockerfile" == "dockerfiles/Dockerfile.nogil" ]; then
        #     continue
        # fi
        docker build -t $(echo $dockerfile | cut -d'.' -f2):latest . -f $dockerfile
    done
    cd ..
    # docker build -t nogil_fastapi:latest . -f Dockerfile.nogil
    # docker build -t async_fastapi:latest . -f Dockerfile.async
    # docker build -t asyncgil_fastapi:latest . -f Dockerfile.asyncgil
    # docker build -t sync_fastapi:latest . -f Dockerfile.sync
}

function run(){
    # docker run -p 8888:80 --name nogil_fastapi -it -d nogil_fastapi:latest
    docker run -p 8800:80 --name async_fastapi -it -d async_fastapi:latest 
    docker run -p 8804:80 --name sync_socketify -it -d sync_socketify:latest 
    docker run -p 8803:80 --name asyncgil_fastapi -it -d asyncgil_fastapi:latest 
    docker run -p 8802:80 --name sync_fastapi -it -d sync_fastapi:latest 
    docker run -p 8805:80 --name async_socketify -it -d async_socketify:latest 
}

function stop(){
    # docker stop nogil_fastapi
    docker stop async_fastapi
    docker stop asyncgil_fastapi
    docker stop sync_fastapi
    docker stop sync_socketify
    docker stop async_socketify
}

function rm(){
    # docker stop nogil_fastapi
    docker stop async_fastapi
    docker stop asyncgil_fastapi
    docker stop sync_fastapi
    docker stop sync_socketify
    docker stop async_socketify
    # docker rm nogil_fastapi
    docker rm async_fastapi
    docker rm asyncgil_fastapi
    docker rm sync_fastapi
    docker rm sync_socketify
    docker rm async_socketify
}
function check(){
    docker ps -a | grep fastapi
}

function build_run(){
    rm
    build
    run
}

function test_throughput(){
    # drill --benchmark drill_nogil_conf.yaml -q --stats --timeout 20
    # drill --benchmark drill_async_conf.yaml -q --stats --timeout 20
    # drill --benchmark drill_asyncgil_conf.yaml -q --stats --timeout 20
    # drill --benchmark drill_sync_conf.yaml -q --stats --timeout 20
    drill --benchmark drill_socketify_conf.yaml -q --stats --timeout 20
    # drill --benchmark drill_socketify_async_conf.yaml -q --stats --timeout 20
}

function style(){
    isort .
    black . 
}

#===============================================================================
if [ "$1" == "build" ]; then
    build
elif [ "$1" == "run" ]; then
    run
elif [ "$1" == "stop" ]; then
    stop
elif [ "$1" == "rm" ]; then
    rm
elif [ "$1" == "check" ]; then
    check
elif [ "$1" == "clear_dangling_images" ]; then
    clear_dangling_images
elif [ "$1" == "build_run" ]; then
    build_run

elif [ "$1" == "test_throughput" ]; then
    test_throughput
elif [ "$1" == "style" ]; then
    style
else
    echo "Usage: $0 [build|run|stop|rm|build_run|check|test_throughput|style|clear_dangling_images]"
fi