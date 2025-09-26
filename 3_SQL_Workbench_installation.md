# 🛠️ MySQL Workbench Installation Guide

[![Typing SVG](https://readme-typing-svg.herokuapp.com?size=24&color=00F700&lines=Install+MySQL+Workbench;Setup+SQL+Environment;Start+Managing+Databases)](https://git.io/typing-svg)

💡 **MySQL Workbench** is a **visual tool for database design, development, and administration**.  
You can use it to **design databases, run queries, and manage MySQL servers** easily.

---

## 🖥️ 1️⃣ Windows Installation

### Step 1: Download
- Go to [MySQL Workbench Downloads](https://dev.mysql.com/downloads/workbench/)  
- Select **Windows (x86, 64-bit)**  
- Click **Download**  

### Step 2: Install
1. Open the downloaded `.msi` installer  
2. Click **Next → Next → Install**  
3. Wait for the installation to complete  
4. Click **Finish**  

### Step 3: Launch & Connect
1. Open **MySQL Workbench** from Start Menu  
2. Click **+** under **MySQL Connections**  
3. Enter connection details: hostname, port, username, password  

---

## 🍎 2️⃣ macOS Installation

### Step 1: Download
- Visit [MySQL Workbench Downloads](https://dev.mysql.com/downloads/workbench/)  
- Select **macOS (DMG Archive)**  
- Click **Download**  

### Step 2: Install
1. Open the downloaded `.dmg` file  
2. Drag **MySQL Workbench** into the Applications folder  

### Step 3: Launch & Connect
- Open **Applications → MySQL Workbench**  
- Click **+** under **MySQL Connections** and add your server details  

---

## 🐧 3️⃣ Linux Installation (Ubuntu/Debian)

### Step 1: Update Packages
```bash
sudo apt update
sudo apt install mysql-workbench
mysql-workbench
```

## 🔌 4️⃣ Connect to MySQL Server

1. Click + to create a new connection
2. Fill in the details:
  - Connection Name: Any name you like
  - Hostname: localhost (for local server)
  - Port: 3306 (default)
  - Username: root or your MySQL username
  - Password: Click Store in Vault and enter password
3. Click Test Connection → if successful, click OK
