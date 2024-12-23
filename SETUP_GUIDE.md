# Setting up a new class

## Ongoing updates

For each class, edit the "top matter" sections for the appropriate
markdown files in:

- `src/bna/YYYY/day/`
- `src/bna/YYYY/assignments/`
- `src/bna/YYYY/topics/`

Check the changes by running the docs locally:

```bash
make servedocs
```

Deploy the changes:

```bash
make deploy
make cachebust
```

## Initial setup
Update the Makefile's `deploy` method to the new year, e.g. `2024`.

```bash
# Generate various folders/files for new year from prior year.
# For example:
cp -R src/_includes/bna/2024/ src/_includes/bna/2025/
cp -R src/bna/2023/ src/bna/2024/


cd src/bna/2024/
mv 2023.json 2024.json
```

Update JSON file name to current year (e.g. `2024.json`) and update the year values 
inside the file.

```json
{
  "year": 2024,
  "syllabus": "/bna/2024/"
}
```

Start the local web server using:

```bash
nvm use
make servedocs
```

> You can now check http://localhost:8000 to see changes as you make them.

## Classnotes

Update the year value in below snippet of `classnotes/index.njk`.


```
<<<snipped>>>
 {%- for notepage in collections.classnotes2024 %}
<<<snipped>>>
```

Use this command:

```bash
sed -i '' 's/classnotes2023/classnotes2024/' classnotes/index.njk
```

## Assignments

Update the relevant assignment files.

```bash
# Update index page
cd src/bna/2024/assignments/
sed -i '' 's/assignments2023/assignments2024/' index.njk
```

Edit the top matter in all assignment Markdown files to reflect the new year and tags.

First, mark all tags as `YYYX` such as `202X` to effectively disable them. 

```bash
sed -i '' 's/assignments2023/assignments202X/' *.md
```

Then, as assignments are released, update the top matter
example, on `assignments/1.md`.

```
---
layout: layouts/assignments.njk
title: Favorite News App and Project Beats
date: 2023-04-03 # UPDATE THIS
number: 1
tags:
  - assignments202X # UPDATE THIS 

---
```

## Topics

```bash
cd src/bna/2024/topics/

# Change index page
sed -i '' 's/topicpages2023/topicpages2024/' index.njk

# Change Markdown files en masse
sed -i '' 's/topicpages2023/topicpages2024/' *.md


```

## Classnotes






