Script.properties({
  name = 'Item Extensions - Ninja',
  description = 'Allows Ninjas to throw items above 0xff',
  author = 'Nax',
  version = '1.0.0'
})

-- ASM - Make the ninja throwing routine 16 bit
ASM.patch(0x089b1a58, "lhu v0, 0xe16(s3)")
ASM.patch(0x089b1028, "sh  s4, 0xe16(s0)")
ASM.patch(0x089b1030, "slti v1, s4, " .. Item.count)

-- Make sure none of the new items gets selected by default
for i = 0x100, Item.count - 1 do
  Items[i].level = 0xff
end

local use_item_levels = Script.opt_bool("item_levels", "Use suggested item levels", true)

if use_item_levels then
  -- Swords
  Items.onion_sword.level = 99
  Items.moonblade.level = 97

  -- Knight Swords
  Items.durandal.level = 97
  Items.ragnarok.level = 96
  Items.excalibur.level = 95
  Items.save_the_queen.level = 94

  -- Ninja Blades
  Items.moonsilk_blade.level = 98
  Items.orochi.level = 97
  Items.koga_blade.level = 95
  Items.sasukes_blade.level = 94

  -- Axes
  Items.golden_axe.level = 95
  Items.francisca.level = 92

  -- Flails
  Items.vesper.level = 96

  -- Lances
  Items.gungnir.level = 96
  Items.gae_bolg.level = 95
  Items.dragon_whisker.level = 94
  Items.holy_lance.level = 93
end
