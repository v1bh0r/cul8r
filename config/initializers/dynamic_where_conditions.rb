class Array
  def where(*args)
    sql = args.first
    unless (sql.is_a?(String) and sql.present?)
      return self
    end
    self[0] = self.first.present? ? " #{self.first} AND #{sql}  " : sql
    self.concat(args[1..-1])
  end
end