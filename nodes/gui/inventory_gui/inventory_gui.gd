@tool
extends GUI
class_name InventoryGUI

@export var item_slots: HBoxContainer
@export var inventory: Inventory: 
	set(value): 
		inventory = value
		if !is_node_ready(): 
			await ready
			
		update()
		if inventory == null: 
			return
			
		if !inventory.items_changed.is_connected(_on_inventory_items_changed): 
			inventory.items_changed.connect(_on_inventory_items_changed)


func _ready() -> void: 
	if Engine.is_editor_hint(): 
		return
	PlayerManager.player_instanced.connect(_on_player_instanced)
	MouseDrag.dragging_cancelled.connect(_on_dragging_cancelled)
	MouseDrag.dropped.connect(_on_dropped)
	

func _on_player_instanced() -> void: 
	update()
	
	
func _on_inventory_items_changed(_new_items: Array[ItemStack]) -> void: 
	update()


func update() -> void: 
	var children: Array[Node] = item_slots.get_children()
	for i: int in children.size(): 
		var slot: ItemSlot = children[i]
		
		slot.item = null
		
	if inventory == null: 
		return
		
	for i: int in inventory.items.size(): 
		var slot: ItemSlot = children[i]
		slot.item = inventory.items[i]
		#printerr(slot.item)
	
	
func _on_dragging_cancelled() -> void: 
	update()
	
	
func _on_dropped() -> void: 
	update()
