

namespace :add_apple_to_basket do

  ## Create apple tables
  task create_apple: :environment do
    execute <<-SQL
      CREATE TABLE apples (
          id integer NOT NULL,
          basket_id integer,
          variety character varying,
          created_at timestamp without time zone NOT NULL,
          updated_at timestamp without time zone NOT NULL
        )
      SQL
    end
  end


  ## Create baskets tables
  task create_basket: :environment do
    execute <<-SQL
      CREATE TABLE baskets (
          id integer NOT NULL,
          capacity integer,
          fill_rate character varying,
          created_at timestamp without time zone NOT NULL,
          updated_at timestamp without time zone NOT NULL
        )
      SQL
    end
  end


  ## 1) Find an available basket that has 0 or is filled with at least 1 apple of the same sort as the variety argument.

  ## Create baskets tables
  task find_variety: :environment do
    Basket.include(:apples).where('capacity = ? or capacity = ?', 0,1).sort('apples.variety')
  end



end
