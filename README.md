# S3Sync

S3-Sync is a Docker container which syncs one or multiple files/folders to S3 using the aws cli S3 sync tool.

To tell the docker container what to sync from the host machine, mount the desired folder as a volume under the /data directory.

environment variables required:
- ACCESS_KEY - AWS access key
- SECRET_KEY - AWS secret key
- S3PATH - S3 bucket and path
- S3CMDPARAMS - custom parameters for the aws cli

Example volumes to be mounted:
- `/tmp/s3-sync-logs:/logs/` - To write logs of the AWS S3 cli to `/tmp/s3-sync-logs`
- `~/Documents:/data/` - Sync the contents of the `~/Documents` folder to S3

### Example
```
docker run -v /tmp/s3-sync-logs:/logs/ -v ~/Documents:/data/ -e "ACCESS_KEY=YOURACCESSKEY" -e "SECRET_KEY=YOURSECRET" -e "S3PATH=s3://s3bucket/" -e "S3CMDPARAMS=PARAMS" tiboonn/s3sync
```
