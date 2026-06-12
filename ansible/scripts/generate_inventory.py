import json

with open("tf_output.json") as f:
    data = json.load(f)

private_ip = data["private_ip"]["value"]
ansible_user = data["ansible_user"]["value"]

inventory_content = f"""[linux]
{private_ip}

[linux:vars]
ansible_user={ansible_user}
"""

with open("inventories/inventory.ini", "w") as inventory:
    inventory.write(inventory_content)

print("Inventory generated successfully")