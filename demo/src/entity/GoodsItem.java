package entity;

/**
 * 购物项：含购买的商品编号，商品及购买数量
 */
public class GoodsItem {
    private int goodsId;//
    private Goods goods;//
    private int num;//

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "GoodsItem{" +
                "goodsId=" + goodsId +
                ", goods=" + goods +
                ", num=" + num +
                '}';
    }
}