UPDATE item_template SET BuyPrice = (BuyPrice)*2 WHERE class = '2' AND entry IN (SELECT item FROM npc_vendor WHERE entry BETWEEN '500000' AND '500050') AND Buyprice > '0' AND ExtendedCost = '0';
UPDATE item_template SET BuyPrice = (BuyPrice)*2 WHERE class = '4' AND entry IN (SELECT item FROM npc_vendor WHERE entry BETWEEN '500000' AND '500050') AND Buyprice > '0' AND ExtendedCost = '0';
