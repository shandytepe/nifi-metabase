# **NiFi Metabase**
---

Merupakan repository yang digunakan untuk kebutuhan Workshop Intro to Data Engineer + Data Storage Sekolah Data Engineer Pacmann

## **Workflow**
---
1. Extract data dari Data Source
2. Membuat ETL Pipeline
3. Dump to Data Warehouse
4. Membuat Visualisasi dan Analisa menggunakan Metabase

![workflow_workshop.png](assets/workflow-workshop.png)

## **Tools**
---
1. Postgres: untuk Data Source dan Data Warehouse
2. NiFi: untuk membuat ETL Pipeline (GUI based)
3. Metabase: untuk membuat Visualisasi dan Analisa terhadap Data Warehouse

## **How to Run it**
---

- Run `docker compose up -d --build`
- Untuk setup koneksi dari NiFi ke Data Source atau Data Warehouse, untuk host gunakan nama container database yang ada di `docker-compose.yml`.
- Semisal ingin membuat koneksi ke Data Warehouse, maka koneksinya adalah `jdbc:postgresql://postgres_dwh_container:5432/pachotel_dwh`

## **NiFi Config**
---

- Jika ingin membuat NiFi menjadi persistent atau setiap build tidak hilang confignya kita bisa copy `conf` folder pada container NiFi ke local kita. Pastikan sudah mount volume `./nifi/conf:/opt/nifi/nifi-current/conf`
- Setelah build container NiFi, masukkan command `docker exec -it nifi_container sh`
- Setelah itu copy folder `conf` pada container ke local dengan menggunakan command `docker cp nifi_container:/opt/nifi/nifi-current/conf ./nifi/.`
- Untuk config Database Connection pada NiFi gunakan config berikut:
    ```
    Database Connection URL: jdbc:postgresql://<CONTAINER_NAME>:5432/<DB_NAME>
    Database Driver Class Name: org.postgresql.Driver
    Database Driver Location: /opt/nifi/nifi-current/drivers/postgresql-42.6.0.jar
    Database User: postgres
    Password: cobapassword
    ```