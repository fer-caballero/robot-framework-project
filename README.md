# Proyecto de Automatización con Robot Framework 🤖

Este repositorio es una aplicación práctica de los conocimientos adquiridos durante el curso de **Robot Framework**, enfocado en la creación de pruebas automatizadas robustas, escalables y fáciles de mantener.

## 🚀 Características del Proyecto

El proyecto implementa las mejores prácticas de la industria, incluyendo:

* **Page Object Model (POM):** Estructura organizada para separar la lógica de los elementos de la página de los casos de prueba, mejorando la mantenibilidad.
* **BDD (Behavior Driven Development):** Escritura de pruebas utilizando lenguaje natural (Gherkin) para facilitar la comunicación entre perfiles técnicos y de negocio.
* **Generación de Reportes:** Configuración para la creación automática de reportes detallados y logs de ejecución nativos de Robot Framework.
* **Manejo Multi-Browser:** Pruebas configuradas para ejecutarse en distintos navegadores utilizando `SeleniumLibrary` y `webdriver-manager`.

## 🛠️ Tecnologías y Dependencias

A continuación, se detallan las librerías principales utilizadas en este entorno:

| Paquete | Versión |
| :--- | :--- |
| **Robot Framework** | 7.4.1 |
| **SeleniumLibrary** | 6.8.0 |
| **Selenium** | 4.40.0 |
| **Webdriver-manager** | 4.0.2 |
| **Requests** (API Testing) | 2.32.5 |
| **Python-dotenv** | 1.2.1 |

> **Nota:** Para ver la lista completa de dependencias técnicas (trio, urllib3, etc.), consulta el archivo `requirements.txt` o ejecuta `pip list`.

## 🔧 Instalación

1. Clona este repositorio.
2. Asegúrate de tener Python instalado.
3. Instala las dependencias necesarias:
   ```bash
   pip install -r requirements.txt
   
Ejecución: robot -d results tests/