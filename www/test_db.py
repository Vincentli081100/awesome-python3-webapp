import orm
import asyncio
from models import User

async def test(loop):
    #await orm.create_pool(user='www-data', password='www-data', db='awesome',loop=loop)
    await orm.create_pool(user='root', password='Leevis991224', db='awesome',loop=loop)

    u = User(name='Test6', email='test6@example.com', passwd='1234567890', image='about:blank')

    await u.save()

if __name__ == '__main__':

    loop = asyncio.get_event_loop()

    #tasks = [test(loop), test_get(loop)]

    #loop.run_until_complete(asyncio.wait(test(loop)))

    loop.run_until_complete(test(loop))

    print('test finished')

    loop.close()

