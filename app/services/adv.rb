#广告服务
post("/android/adv/main") do
  advs = Adv.where(:expire.gte => Time.now)
  return advs[Random.rand(advs.size)].to_json if advs.size > 0
  {}
end
