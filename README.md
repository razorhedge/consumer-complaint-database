# consumer-complaint-database
## Todo:Finish Readme
Run:
``` docker build -t custom-postgres . ```
Then:
```docker run --name postgres-container -p 5432:5432 -d custom-postgres```
Finally:
```docker run --name my-postgres-container -p 5432:5432 -v /path/to/your/dataset.csv:/data/dataset.csv -d my-custom-postgres```
