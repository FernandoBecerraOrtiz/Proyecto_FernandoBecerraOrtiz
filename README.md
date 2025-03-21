# Paleta de colores

## Table Styling in Markdown

<style>
    .heatMap {
        width: 70%;
        text-align: center;
    }
    .heatMap th {
        background: grey;
        word-wrap: break-word;
        text-align: center;
    }
    .heatMap tr:nth-child(1) { background: red; }
    .heatMap tr:nth-child(2) { background: orange; }
    .heatMap tr:nth-child(3) { background: green; }
</style>

<div class="heatMap">

| Everything | in this table | is Centered | and the table will only take up 70% of the screen width | 
| -- | -- | -- | -- |
| This | is | a | Red Row |
| This | is | an | Orange Row |
| This | is | a | Green Row |

</div>

### Primarios
- `#3498db` <span style="background-color: #3498db; color: white; padding: 5px 10px; border-radius: 5px;">&nbsp; Azul &nbsp;</span>
- `#2ecc71` <span style="background-color: #2ecc71; color: white; padding: 5px 10px; border-radius: 5px;">&nbsp; Verde &nbsp;</span>
- `#e74c3c` <span style="background-color: #e74c3c; color: white; padding: 5px 10px; border-radius: 5px;">&nbsp; Rojo &nbsp;</span>

### Secundarios
- `#f1c40f` <span style="background-color: #f1c40f; color: black; padding: 5px 10px; border-radius: 5px;">&nbsp; Amarillo &nbsp;</span>
- `#9b59b6` <span style="background-color: #9b59b6; color: white; padding: 5px 10px; border-radius: 5px;">&nbsp; Morado &nbsp;</span>
- `#34495e` <span style="background-color: #34495e; color: white; padding: 5px 10px; border-radius: 5px;">&nbsp; Gris Oscuro &nbsp;</span>

# Astro Starter Kit: Basics

```sh
npm create astro@latest -- --template basics
```

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |
