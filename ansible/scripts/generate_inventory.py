import json
import os

TF_OUTPUT_FILE = "tf_output.json"
INVENTORY_FILE = "../inventories/inventory.ini"

with open(TF_OUTPUT_FILE, "r") as f:
    data = json.load(f)

private_ip = data["private_ip"]["value"]
ansible_user = data["ansible_user"]["value"]
bastion_ip = data["bastion_public_ip"]["value"]

inventory_content = f"""
[linux]
{private_ip}

[linux:vars]
ansible_user={ansible_user}
bastion_host={bastion_ip}
"""

os.makedirs(os.path.dirname(INVENTORY_FILE), exist_ok=True)

with open(INVENTORY_FILE, "w") as inventory:
    inventory.write(inventory_content)

print("Inventory generated successfully")