class Item < ApplicationRecord
    enum is_active: { sale: true, no_sale: false }
end
