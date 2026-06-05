import sys

with open("ICS3UCulminating/Model/Gene.swift", "r") as f:
    lines = f.readlines()

header = []
for line in lines:
    if "let exampleGeneList: [Gene] = [" in line:
        header.append(line)
        break
    header.append(line)

existing_genes_lines = []
start_collecting = False
for line in lines:
    if "let exampleGeneList: [Gene] = [" in line:
        start_collecting = True
        continue
    if start_collecting:
        if "]" in line and len(line.strip()) <= 2:
            break
        existing_genes_lines.append(line)

with open("genes_output.txt", "r") as f:
    new_genes_lines = f.readlines()

new_content = "".join(header)
new_content += "".join(existing_genes_lines)
# Ensure the last existing gene has a comma if it doesn't
if existing_genes_lines and not existing_genes_lines[-1].strip().endswith(","):
    # This might be tricky if it's the last one. 
    # But in the file it was Gene(name: "MHC", ... )
    pass

new_content += "\n".join([line.rstrip() for line in new_genes_lines])
new_content += "\n]\n"

with open("ICS3UCulminating/Model/Gene.swift", "w") as f:
    f.write(new_content)

