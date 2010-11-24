module Cpr
  module Kunderefnr
    def pnr
      @pnr ||= self['Kunderefnr'] =~ /^PNR=(\d+)/ && $1
    end

    def birthday
      if pnr
        day = pnr[0..1].to_i
        month = pnr[2..3].to_i
        year_without_century = pnr[4..5].to_i
        Date.new(year_without_century + birthday_century, month, day)
      end
    end

    def pnr_assigned_digits
      pnr[6..9] if pnr
    end

    # private
    def birthday_century
      d = pnr[6].to_i
      year = pnr[0..1].to_i
      if pnr
        if d < 4
          1900
        else
          if year <= 36
            2000
          elsif [9,4].include?(d)
            1900
          elsif [5,6,7,8].include?(d) and year > 58
            1800
          else
            raise "Invalid birthday century for #{pnr}"
          end
        end
      end
    end

  end
end
