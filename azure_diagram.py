from diagrams import Diagram, Cluster
from diagrams.azure.compute import FunctionApps
from diagrams.azure.database import SQLDatabases
from diagrams.azure.analytics import DataFactories
from diagrams.azure.storage import BlobStorage

with Diagram("Azure Architecture", show=True) as diag:
    with Cluster("Data Upload & Processing Workflow"):
        blob_storage = BlobStorage("Blob Storage\n(Complaints Dataset)")
        function_apps = FunctionApps("Azure Function\n(Trigger on File Update)")
        data_factory = DataFactories("Data Factory\n(Load and Transform)")
        sql_databases = SQLDatabases("Azure SQL Database\n(PostgreSQL)")

    blob_storage >> function_apps >> data_factory >> sql_databases