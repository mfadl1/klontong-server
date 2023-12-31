PGDMP     &    $    
            {            brik    14.3    15.1 0    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            /           1262    35741    brik    DATABASE        CREATE DATABASE brik WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE brik;
                postgres    false                        2615    35795    authenticator    SCHEMA        CREATE SCHEMA authenticator;
    DROP SCHEMA authenticator;
                postgres    false                        2615    35742 	   inventory    SCHEMA        CREATE SCHEMA inventory;
    DROP SCHEMA inventory;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            0           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    35797    mikro_orm_migrations    TABLE     �   CREATE TABLE authenticator.mikro_orm_migrations (
    id integer NOT NULL,
    name character varying(255),
    executed_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 /   DROP TABLE authenticator.mikro_orm_migrations;
       authenticator         heap    postgres    false    7            �            1259    35796    mikro_orm_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE authenticator.mikro_orm_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE authenticator.mikro_orm_migrations_id_seq;
       authenticator          postgres    false    7    218            1           0    0    mikro_orm_migrations_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE authenticator.mikro_orm_migrations_id_seq OWNED BY authenticator.mikro_orm_migrations.id;
          authenticator          postgres    false    217            �            1259    35805    users    TABLE     �  CREATE TABLE authenticator.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone_number character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
     DROP TABLE authenticator.users;
       authenticator         heap    postgres    false    7            �            1259    35804    users_id_seq    SEQUENCE     �   CREATE SEQUENCE authenticator.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE authenticator.users_id_seq;
       authenticator          postgres    false    7    220            2           0    0    users_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE authenticator.users_id_seq OWNED BY authenticator.users.id;
          authenticator          postgres    false    219            �            1259    35744    mikro_orm_migrations    TABLE     �   CREATE TABLE inventory.mikro_orm_migrations (
    id integer NOT NULL,
    name character varying(255),
    executed_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 +   DROP TABLE inventory.mikro_orm_migrations;
    	   inventory         heap    postgres    false    6            �            1259    35743    mikro_orm_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE inventory.mikro_orm_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE inventory.mikro_orm_migrations_id_seq;
    	   inventory          postgres    false    6    212            3           0    0    mikro_orm_migrations_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE inventory.mikro_orm_migrations_id_seq OWNED BY inventory.mikro_orm_migrations.id;
       	   inventory          postgres    false    211            �            1259    35765    product_details    TABLE     �  CREATE TABLE inventory.product_details (
    id integer NOT NULL,
    product_id integer NOT NULL,
    description character varying(255),
    buy_price integer DEFAULT 0 NOT NULL,
    sell_price integer DEFAULT 0 NOT NULL,
    url_image character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    rating double precision
);
 &   DROP TABLE inventory.product_details;
    	   inventory         heap    postgres    false    6            �            1259    35764    product_details_id_seq    SEQUENCE     �   CREATE SEQUENCE inventory.product_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE inventory.product_details_id_seq;
    	   inventory          postgres    false    216    6            4           0    0    product_details_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE inventory.product_details_id_seq OWNED BY inventory.product_details.id;
       	   inventory          postgres    false    215            �            1259    35752    products    TABLE     m  CREATE TABLE inventory.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sku character varying(255) NOT NULL,
    category character varying(255),
    is_active boolean NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE inventory.products;
    	   inventory         heap    postgres    false    6            �            1259    35751    products_id_seq    SEQUENCE     �   CREATE SEQUENCE inventory.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE inventory.products_id_seq;
    	   inventory          postgres    false    6    214            5           0    0    products_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE inventory.products_id_seq OWNED BY inventory.products.id;
       	   inventory          postgres    false    213            }           2604    35800    mikro_orm_migrations id    DEFAULT     �   ALTER TABLE ONLY authenticator.mikro_orm_migrations ALTER COLUMN id SET DEFAULT nextval('authenticator.mikro_orm_migrations_id_seq'::regclass);
 M   ALTER TABLE authenticator.mikro_orm_migrations ALTER COLUMN id DROP DEFAULT;
       authenticator          postgres    false    218    217    218                       2604    35808    users id    DEFAULT     r   ALTER TABLE ONLY authenticator.users ALTER COLUMN id SET DEFAULT nextval('authenticator.users_id_seq'::regclass);
 >   ALTER TABLE authenticator.users ALTER COLUMN id DROP DEFAULT;
       authenticator          postgres    false    220    219    220            r           2604    35747    mikro_orm_migrations id    DEFAULT     �   ALTER TABLE ONLY inventory.mikro_orm_migrations ALTER COLUMN id SET DEFAULT nextval('inventory.mikro_orm_migrations_id_seq'::regclass);
 I   ALTER TABLE inventory.mikro_orm_migrations ALTER COLUMN id DROP DEFAULT;
    	   inventory          postgres    false    212    211    212            w           2604    35768    product_details id    DEFAULT     ~   ALTER TABLE ONLY inventory.product_details ALTER COLUMN id SET DEFAULT nextval('inventory.product_details_id_seq'::regclass);
 D   ALTER TABLE inventory.product_details ALTER COLUMN id DROP DEFAULT;
    	   inventory          postgres    false    216    215    216            t           2604    35755    products id    DEFAULT     p   ALTER TABLE ONLY inventory.products ALTER COLUMN id SET DEFAULT nextval('inventory.products_id_seq'::regclass);
 =   ALTER TABLE inventory.products ALTER COLUMN id DROP DEFAULT;
    	   inventory          postgres    false    213    214    214            '          0    35797    mikro_orm_migrations 
   TABLE DATA           L   COPY authenticator.mikro_orm_migrations (id, name, executed_at) FROM stdin;
    authenticator          postgres    false    218   �:       )          0    35805    users 
   TABLE DATA           g   COPY authenticator.users (id, name, phone_number, password, email, created_at, updated_at) FROM stdin;
    authenticator          postgres    false    220   ;       !          0    35744    mikro_orm_migrations 
   TABLE DATA           H   COPY inventory.mikro_orm_migrations (id, name, executed_at) FROM stdin;
 	   inventory          postgres    false    212   �;       %          0    35765    product_details 
   TABLE DATA           �   COPY inventory.product_details (id, product_id, description, buy_price, sell_price, url_image, created_at, updated_at, stock, rating) FROM stdin;
 	   inventory          postgres    false    216   �<       #          0    35752    products 
   TABLE DATA           a   COPY inventory.products (id, name, sku, category, is_active, created_at, updated_at) FROM stdin;
 	   inventory          postgres    false    214   �J       6           0    0    mikro_orm_migrations_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('authenticator.mikro_orm_migrations_id_seq', 1, true);
          authenticator          postgres    false    217            7           0    0    users_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('authenticator.users_id_seq', 2, true);
          authenticator          postgres    false    219            8           0    0    mikro_orm_migrations_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('inventory.mikro_orm_migrations_id_seq', 5, true);
       	   inventory          postgres    false    211            9           0    0    product_details_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('inventory.product_details_id_seq', 56, true);
       	   inventory          postgres    false    215            :           0    0    products_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('inventory.products_id_seq', 58, true);
       	   inventory          postgres    false    213            �           2606    35803 .   mikro_orm_migrations mikro_orm_migrations_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY authenticator.mikro_orm_migrations
    ADD CONSTRAINT mikro_orm_migrations_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY authenticator.mikro_orm_migrations DROP CONSTRAINT mikro_orm_migrations_pkey;
       authenticator            postgres    false    218            �           2606    35818    users users_email_unique 
   CONSTRAINT     [   ALTER TABLE ONLY authenticator.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 I   ALTER TABLE ONLY authenticator.users DROP CONSTRAINT users_email_unique;
       authenticator            postgres    false    220            �           2606    35816    users users_phone_number_unique 
   CONSTRAINT     i   ALTER TABLE ONLY authenticator.users
    ADD CONSTRAINT users_phone_number_unique UNIQUE (phone_number);
 P   ALTER TABLE ONLY authenticator.users DROP CONSTRAINT users_phone_number_unique;
       authenticator            postgres    false    220            �           2606    35814    users users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY authenticator.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY authenticator.users DROP CONSTRAINT users_pkey;
       authenticator            postgres    false    220            �           2606    35750 .   mikro_orm_migrations mikro_orm_migrations_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY inventory.mikro_orm_migrations
    ADD CONSTRAINT mikro_orm_migrations_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY inventory.mikro_orm_migrations DROP CONSTRAINT mikro_orm_migrations_pkey;
    	   inventory            postgres    false    212            �           2606    35793 $   product_details product_details_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY inventory.product_details
    ADD CONSTRAINT product_details_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY inventory.product_details DROP CONSTRAINT product_details_pkey;
    	   inventory            postgres    false    216            �           2606    35778 1   product_details product_details_product_id_unique 
   CONSTRAINT     u   ALTER TABLE ONLY inventory.product_details
    ADD CONSTRAINT product_details_product_id_unique UNIQUE (product_id);
 ^   ALTER TABLE ONLY inventory.product_details DROP CONSTRAINT product_details_product_id_unique;
    	   inventory            postgres    false    216            �           2606    35761    products products_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY inventory.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY inventory.products DROP CONSTRAINT products_pkey;
    	   inventory            postgres    false    214            �           2606    35763    products products_sku_unique 
   CONSTRAINT     Y   ALTER TABLE ONLY inventory.products
    ADD CONSTRAINT products_sku_unique UNIQUE (sku);
 I   ALTER TABLE ONLY inventory.products DROP CONSTRAINT products_sku_unique;
    	   inventory            postgres    false    214            �           2606    35785 2   product_details product_details_product_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY inventory.product_details
    ADD CONSTRAINT product_details_product_id_foreign FOREIGN KEY (product_id) REFERENCES inventory.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY inventory.product_details DROP CONSTRAINT product_details_product_id_foreign;
    	   inventory          postgres    false    216    214    3205            '   A   x�3���L/J,���32026�4414�f� �������������������������9W� �",      )   �   x�}�MK�0��s�)v�M���֤=Iq�%��t�^ڵ�2��d�Ӌ����Ï���;�@SF��5 �U�Od�ۀD^�m�^����m�|�����qVFM���Y�t��~�#gw�����Kۑ��#�O!�R1a<�*�>aZ]���0;��Z��lT�>U��=����X7Y7YO�����[����ݥFř������ 2J�?����	��:KR�      !   �   x�m�;�0E�:^=����{쀆
�	�ᄆ�#��;4]����^�*	�bZ�u&=�4�&��gx�3G=8�%�Y8�N�.X�.{6�����)�E��Ǽ��a.u���9�ʯ#m�ƚ���ֻ��3C>�      %     x��Z�n�V�}Ş$HP�,��p�dٲ�kYnS7N
G�t"���ú.� @B�zڳ��GT�I���>��I��!@���0��{��IG8b����DQjV��VG[�%e���lC�ީfx�~�/߮�U�����i��Ci�^d��XV�</L\GUy�W�:]eR'��p��w��9>�Gnpḽ�;r�џ���g���7w\��n~6+�����*��3v���Lg@ֹ*�IU:�t{E�.�D��^W[Z�__Q��mf�y��.]j�鈢�Λ�z���,����n�� ���'<ʴ��"���"-����Q%�ԫ�b�����J��j��}�_TQ*�M����y-b J��/���9c�Y�u�e����2Sg���d4��N��;��5����t��K�:��m-�J�����T����7��G�O����:��D{�hu���^1���RE&�nT�ʌ��ȷ��X�^t�h��S+�U��}
軞�V���2h;�n�\F���,~V�;���'�1�R�$���\�j�TF��+��Tѥ�b������),|�-��6Ђag(�Ǆ;f���W8��5�˼29=3ڻ�B��;��*�i�ҥ��%@O�961r�:��[����ܠ3#V���L�2W*�QX�SW��(�/:V�"0�EF;�w����X������.@�X1�3K��*�:U���e�2��ވ}�&o}��^g,��.[�����[���#��pr��`��8ͳΜ>��~��ɡ�,�Y�U8���)��m��~�����(_t�%�	ή�9�`�<�Sn��Z�7���������0�����[rA�|ހ��}I�����b��saD�2WIW���:�.ݥy�ʒ�#�&я5o��Ū�h3Ძ)2h6YU�
ĖU��B4��T�B'³8�P�)v�縃��e�'�*����Bn��)*�,�>�����MAs�Kz6)�g���� ���7�6��X��n�xlΏ�V������ffC!G��=�#&�ءA�PbX�ʲb2bU��!`�뛽Z�\����E�7ОP�	��L���;Sp.��/���u�+�N����6 ���M��lMy:�������q���;%�mj$��u:XcAq�u�@Ϟ�V��b
h�c~������y(�LhRȕ���)���l�?j�h��w
�6���a�,�������C���K���O0��Y�� ��;�Nsfi��:e��ub�f����x�:�t,��zJY��HF(��s(�JR��M*�Y��$)�Y�1Mq99jn\vq'�aZh[�Vٙf�.Ā� e_T"[n�fA��t���Nᬬ,p��]�¿��)���܎3X����8���&|�.!u�_��0|�A򲇁|�4�����5`���
�i�)�G���<�7��Vő���pƠ��r��T]P� kl��'�70�(Wk	�RZ�p0
�T!��(J�7��'�kS'�X4��_,3���i�b|�;Wf�`-�������V%y�f[v؊�^�bW�6��s�7�a��\Q]�������]*����%~2C%�Aj�V����	p����A�u����2�p�r�x�T�V6}����
�)Ѵ�S:��h�ff��o�5.�	då��u�������iH'� mR����'�hu��6N����Xax�`Q,���T��I&�Y"_�k�)P6�^.�v�;X�7 ks��>t\_`1G��������Ve�aH���V��p�����ǝ�E�Q�j$�:��Wؾ[C-Ok� ��=���>�P�q���7�,�UI��Ɂ�r��z2%B��=zУ��Xݠ׬����V?����6܋gۣ�RZZ1��<X.�f�JE��c�[�r��[��k���%<''`�睭�B5^ϱ1rN ֪jb6�G;�#h���
"E�".!0���dI��9\��/Ȼj��(��6̥�D�����լ�o�����:8��M���}�� �g"Ӝ`Т�*�x?xP
�YB ',�l��zM���d��h�FU���4�6�K���X`�b�q]�/S�ǲ�1��w�\r�������ڂ��evǖ��.��E�� �B�塎� E`!N>n3����v`bR�wF3�
D�ds�Ԅ]iz`댛�N��ٕO*�r�[�%]���X�TC���ym�F7v;��""��$��7*y�t�T�8���U2^Y�&\T�:�C�i���4�TS��Y]d�NE�,��ޠ��V����t<W`y�U�K������x��T�,{8�X��14ki�,Sd���X���Dm�#��ALO�BK���+n/��#��eS��<�w�����;v@'�v�t�\�R�O��w�kU"�����,�|�}�f��Ҳaw幝�ET�,� �xV��K�B�)A�C���>9;��Į�IQ���S�y K����jL�L�p�du+���0�N���>�4kgh�8�ީ�*v`�'2vd���-�J�A-xm� �1X� �RL�m{�Iࡧ���ʺB�>�9�bj�;�eIW��21u	�?o�Dp����T�5O���L���&�����72����)4hS9���d�p�L��b���N�w���:��7�O��t1�-�����k
�%�X..�� �>�|�@��{�-�?Qx=	�[���Li،�<ȣ�(����mpvZ%vG��!��<D�9��:�u���b��x���]P�\T���X��M��9�<~��Ӛ�j��ny�25�'����[w8��9G�`�I�����5���s�{{���D�lH?d ���V�X+�e#J9�U?�����U^���l*�n8��P��d�g�!�������Z��;�A�w7�K
��-�����w�w��|�>����:�]$eɪ�?��Z��X�	0�V�ϰ� ��®�M.��tw��1�����_? !�ِ�O��邾�F_���iry7=q��'��Ҧ��� ��'n���M���օ/7&���gl��b�ɞ"�b(�c]٢���x�~������?�F�����Xnu�t��~�ҶAV:M&m4+�WS��b������M���ߴ�x�9���S�0#gQ�+y�ڇ/���m�g��:>R �>W�����f��΋d�<q1��X(+��{���}2Y�yº֕ոݻ�="^V�z����)�X��!��U�"ls�`�G�)��y
�X\��xd�eդ>��<�+~�t��:�
����5C��x�z�e�Ґ-̔�H�5��׶�o�p�����oz���R���W.��3��@83��_�Ğ%:?['/]�C��B�C����-�p��[ͦIV�����o�Y�Ͻ�n�G���ne��d�K(o�@L���><�\b�[�r�%<z����q�7��MYJ}�\^KpOx9�oS�� `�vNxa��_V��~a����G�Κ
�3d�M���j��W�v8�0"Z�&��:�@`Y�M�o�e��`�ivV�k��ϟ��u.���G����ol��:��:�ο M=�      #   �  x���[o�����_a�����riҾ9`
`��i��M����K;ݿ�,�I���K)m����Z�����*�o�)�c�G�ܢ���I�4�E��xBF�Ě���>��z1�]������z5>>$L�ȏMW=�*^eݜ�4Y�"Y�߳D���8�գο����.��'#��2�a>я�QnP�o�J��V(�1	���|M℣2?��t)c��U^��ޱ���A+ЇG��1(,��jԾŢ���V��쌧����p�ݔ�,q���MyL�I`���8-�BUؚgm�f7������|��k�-t���;J̋�	%1K�,d�����s�Wۋ���e��*�4CZ&|�y�&�U�Xle��S-��P_�._a�(%q��o�b�"UZn�A��۪��y+wgi>��wi`s��Mli��2�7�c�X�aG~H"Nu�nda4#���8���o����]�*0
�;,d��X��{�A��l@m�!�%Y�����浼�<Gi-���dt,1M�1-���`0�i��i�*����d������F��i���e	��e�~;�̻����a�_D�����7��P����ۗRb�t�u���H��=�>��u���i�$��WH������B;y^�0o���l4����Nq(��	�kd�@�Aϵ�ʺ�|�#V>�7��2�੖�h�,X�n�T�:H3����'�C�>K̚FB�bW�v��UuF��h��>�
"w��{�'��>2/|�dSx_wE����`3�{ H�1����DY:�fhՕ����N� �+�C_e]��o�#��p��9���P��k�)�>IPzO; �'^2t�e��[�K�#�|/`�ڀ�%�����<�0Im��ʀ�8C�h�`v|�eY4Sh��Tu<	&a��/<��4Ia�
��E`�ݶ�a���7�{ٻ��	��������/��`hG�������p��<@���P��*��^����ڿCn�@�I"����,���}WW��K�d����xn��^b;�KC��������2bS����	N��u_�UnxBR�il����b8�T�v�����Oe�+�HajI�2P�$J)_a:;�B���A��!��!d=�g$h���d������qiO�{U�eϥњ��0�����$��@M�TG��T�0���� U�w�����8F�If�;������x��E֍���!e������h0q:Bo��VT ��R��|Bn�(����c��yj��_y)�rP�y$��HӐ�>7]~��2� G�uW�9��o֪k�j�N�9�,I��d�̄g0�,��0j�����S���3�	��d%�ĉ��30y�(ʲ�aW�1T�j���77P�����x�p��t`9f(�!�`(�V|��?���z�}?���}݀����_��5G�������]�>04mq�m]��'e�C;��ď��X0(�ه�t�S������cK�9\[#���8ֳ�F�c)���R���l����޷ȯ�EU|�~dn ����~�?��ηb�˺����8�I����B�#�~���p�Dw;���W�Qb�z��ڽ#t47�d����6[w���hz=����t5��_��5�|�n�[�_\�`kz7��M'�k����ȯV�f���5����+>`��ز�_ ��^�������g�     