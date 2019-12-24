# mergerfs-docker

A docker container running [mergerfs](https://github.com/trapexit/mergerfs).

## How to run

```
docker run \
-v $PWD/one:/disks/one \
-v $PWD/two:/disks/two \
-v $PWD/merged:/merged:shared \
--device /dev/fuse \
--cap-add SYS_ADMIN \ 
homespirit/mergerfs
```

The above command starts a mergerfs container which makes the files in `$PWD/one` and `$PWD/two` available under `$PWD/merged`.