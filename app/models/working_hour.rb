class WorkingHour < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '１時間' },
      { id: 3, name: '２時間' },
      { id: 4, name: '３時間' },
      { id: 5, name: 'その他、交渉次第' }
    ]
  
end
