# 🛍️ Análisis del crecimiento del e-commerce en Eu

**Autor:** Dulce Tapia
**Herramientas:** R, Tableau, GitHub  
**Fecha:** Mayo 2025

## 📌 Descripción general del proyecto
Este proyecto analiza el crecimiento y la distribución de las empresas de comercio electrónico en Estados Unidos utilizando un conjunto de datos procedentes de Kaggle. 

## 🎯 Objectivo
Analizar qué sectores del e-commerce están experimentando mayor crecimiento y cómo se relaciona esto con su ubicación geográfica en EE. UU., para identificar oportunidades estratégicas de inversión o expansión.

## 🗃️ Dataset
- **Fuente:** Kaggle - USA Online Shopping Data
- **Campos utilizados:**
  - Company Name
  - Ecommerce Type
  - Annual Revenue (USD millions)
  - Growth Rate (%)
  - City and State

## 🔧 Tools & Technologies
|Herramienta | Próposito                    |
|------------|------------------------------|
| **R**      | Limpieza de datos y análisis |
| **Tableau**| Visualización de datos       |
| **GitHub** | Control version & portfolio  |

## 📈 Key Findings
- 📦Los sectores de **moda** y **electrónica** registran el mayor crecimiento medio.
- 🌎 Estados como **California**, **Nueva York** y **Texas** albergan el mayor número de empresas de rápido crecimiento.
- 💹 Algunos estados muestran un **alto crecimiento pero baja densidad**, lo que sugiere oportunidades de expansión.

## 📊 Tableau Dashboard

👉 View the interactive dashboard on **[Tableau Public](https://public.tableau.com/app/profile/tu_usuario)**  
(Snapshot below)
![Dashboard Screenshot](./outputs/plots/dashboard_preview.png)

## 📁 Project Structure
ecommerce-growth-analysis/
├── data/
│ └── usa_ecommerce_data.csv
├── scripts/
│ └── ecommerce_analysis.Rmd
├── outputs/
│ ├── dashboard_tableau.twbx
│ └── plots/
│ └── dashboard_preview.png
├── README.md
└── .gitignore

## 🚀 Cómo ejecutar el proyecto
1. Clonar el repositorio 
 `https://github.com/Dulce-Tapia/Analisis-de-Crecimiento-del-Ecommerce-en-EU.git`
2. Abre `scripts/ecommerce_analysis.Rmd` en RStudio
3. Ejecuta el código para limpiar y analizar los datos
4. Abra `dashboard_tableau.twbx` en Tableau Desktop

