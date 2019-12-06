# 关于Server接入高德的整理（基于BFF层发现的global server的调用）
### 地图相关接入global server的域名是：```https://btccommutewebappint.azurewebsites.net```

## 自由文本搜索
- 路径：
```
/api/poi/search?query=${encodeURIComponent(query)}&origin=${latitude},${longitude}&radius=${radius}&language=${language}&count=${count}

```
### 加油站
- 路径：
```
/api/poi/category/fuel?origin=${latitude},${longitude}&radius=${radius}&language=${language}&count=${count}
```

### 停车场
- 路径：
```
/api/poi/category/parking?origin=${latitude},${longitude}&radius=${radius}&language=${language}&count=${count}
```

### 餐馆
- 路径：
```
/api/poi/category/restaurant?origin=${latitude},${longitude}&radius=${radius}&language=${language}&count=${count}
```

## 以上的返回的数据结构是一样的，都是数组PointOfInterest[]，属于response.body.items

```

数据类定义如下
export interface PointOfInterest {
    id: string;
    name: string;
    vicinity: string;
    distance: number;
    geoLocation: GeoLocation;
    address: PoiAddress;
}
export interface GeoLocation {
    latitude: number;
    longitude: number;
}
export interface PoiAddress {
    formattedAddress: string;
    country: string;
    state: string;
    city: string;
    street: string;
    houseNumber: string;
    postalCode: string;
}
```


### POI Detail
- 路径
```
/api/commute
```
- 返回数据结构是commute[]，属于response.body.destinations
```
数据类定义如下：
export interface Commute {
    id: string;
    lat: number;
    lon: number;
    time: number;
    distance: number;
    baseTime: number;
    errorMessage?: string;
}
```

### 逆地理编码(这个是最近一个月发现在global添加的)

- 路径
```
/api/reversegeocode?mode=retrieveAddress
```
- 返回的数据结构是Address，属于response.body.spData[0]
```
数据类定义如下：
export interface Address {
    latitude: number;
    longitude: number;
    streetAddress: string;
    address: {
        formattedAddress: string;
        country: string;
        state: string;
        county: string;
        city: string;
        street: string;
        houseNumber: string;
        postalCode: string;
    };
}
```