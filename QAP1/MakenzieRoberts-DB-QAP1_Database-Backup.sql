PGDMP                     	    z           qap1    14.5    14.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24643    qap1    DATABASE     a   CREATE DATABASE qap1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Canada.1252';
    DROP DATABASE qap1;
                postgres    false                        2615    24644    qap    SCHEMA        CREATE SCHEMA qap;
    DROP SCHEMA qap;
                postgres    false            �            1259    24683    aircraft_passengers    TABLE     l   CREATE TABLE qap.aircraft_passengers (
    aircraft_id bigint NOT NULL,
    passenger_id bigint NOT NULL
);
 $   DROP TABLE qap.aircraft_passengers;
       qap         heap    postgres    false    4            �            1259    24676 	   aircrafts    TABLE     �   CREATE TABLE qap.aircrafts (
    id bigint NOT NULL,
    type text NOT NULL,
    airline_name text NOT NULL,
    number_of_passengers bigint NOT NULL
);
    DROP TABLE qap.aircrafts;
       qap         heap    postgres    false    4            �            1259    24713    airport_aircrafts    TABLE     h   CREATE TABLE qap.airport_aircrafts (
    airport_id bigint NOT NULL,
    aircraft_id bigint NOT NULL
);
 "   DROP TABLE qap.airport_aircrafts;
       qap         heap    postgres    false    4            �            1259    24664    airports    TABLE     �   CREATE TABLE qap.airports (
    id bigint NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    city_id bigint NOT NULL
);
    DROP TABLE qap.airports;
       qap         heap    postgres    false    4            �            1259    24645    cities    TABLE     |   CREATE TABLE qap.cities (
    id bigint NOT NULL,
    name text NOT NULL,
    state text NOT NULL,
    population bigint
);
    DROP TABLE qap.cities;
       qap         heap    postgres    false    4            �            1259    24652 
   passengers    TABLE     �   CREATE TABLE qap.passengers (
    id bigint NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    phone_number text,
    city_id bigint NOT NULL
);
    DROP TABLE qap.passengers;
       qap         heap    postgres    false    4                      0    24683    aircraft_passengers 
   TABLE DATA           E   COPY qap.aircraft_passengers (aircraft_id, passenger_id) FROM stdin;
    qap          postgres    false    214                     0    24676 	   aircrafts 
   TABLE DATA           N   COPY qap.aircrafts (id, type, airline_name, number_of_passengers) FROM stdin;
    qap          postgres    false    213   S                  0    24713    airport_aircrafts 
   TABLE DATA           A   COPY qap.airport_aircrafts (airport_id, aircraft_id) FROM stdin;
    qap          postgres    false    215   �                  0    24664    airports 
   TABLE DATA           8   COPY qap.airports (id, name, code, city_id) FROM stdin;
    qap          postgres    false    212   !                 0    24645    cities 
   TABLE DATA           :   COPY qap.cities (id, name, state, population) FROM stdin;
    qap          postgres    false    210   �!                 0    24652 
   passengers 
   TABLE DATA           S   COPY qap.passengers (id, first_name, last_name, phone_number, city_id) FROM stdin;
    qap          postgres    false    211   "       y           2606    24687 ,   aircraft_passengers aircraft_passengers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY qap.aircraft_passengers
    ADD CONSTRAINT aircraft_passengers_pkey PRIMARY KEY (aircraft_id, passenger_id) INCLUDE (aircraft_id, passenger_id);
 S   ALTER TABLE ONLY qap.aircraft_passengers DROP CONSTRAINT aircraft_passengers_pkey;
       qap            postgres    false    214    214            w           2606    24682    aircrafts aircrafts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY qap.aircrafts
    ADD CONSTRAINT aircrafts_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY qap.aircrafts DROP CONSTRAINT aircrafts_pkey;
       qap            postgres    false    213            {           2606    24717 (   airport_aircrafts airport_aircrafts_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY qap.airport_aircrafts
    ADD CONSTRAINT airport_aircrafts_pkey PRIMARY KEY (airport_id, aircraft_id) INCLUDE (airport_id, aircraft_id);
 O   ALTER TABLE ONLY qap.airport_aircrafts DROP CONSTRAINT airport_aircrafts_pkey;
       qap            postgres    false    215    215            u           2606    24670    airports airports_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY qap.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY qap.airports DROP CONSTRAINT airports_pkey;
       qap            postgres    false    212            q           2606    24651    cities city_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY qap.cities
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY qap.cities DROP CONSTRAINT city_pkey;
       qap            postgres    false    210            s           2606    24658    passengers passengers_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY qap.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY qap.passengers DROP CONSTRAINT passengers_pkey;
       qap            postgres    false    211            �           2606    24723    airport_aircrafts aircrafts    FK CONSTRAINT     |   ALTER TABLE ONLY qap.airport_aircrafts
    ADD CONSTRAINT aircrafts FOREIGN KEY (aircraft_id) REFERENCES qap.aircrafts(id);
 B   ALTER TABLE ONLY qap.airport_aircrafts DROP CONSTRAINT aircrafts;
       qap          postgres    false    213    215    3191            ~           2606    24688     aircraft_passengers aircrafts_fk    FK CONSTRAINT     �   ALTER TABLE ONLY qap.aircraft_passengers
    ADD CONSTRAINT aircrafts_fk FOREIGN KEY (aircraft_id) REFERENCES qap.aircrafts(id);
 G   ALTER TABLE ONLY qap.aircraft_passengers DROP CONSTRAINT aircrafts_fk;
       qap          postgres    false    3191    214    213            �           2606    24718    airport_aircrafts airports    FK CONSTRAINT     y   ALTER TABLE ONLY qap.airport_aircrafts
    ADD CONSTRAINT airports FOREIGN KEY (airport_id) REFERENCES qap.airports(id);
 A   ALTER TABLE ONLY qap.airport_aircrafts DROP CONSTRAINT airports;
       qap          postgres    false    212    215    3189            |           2606    24659    passengers city_fk    FK CONSTRAINT     l   ALTER TABLE ONLY qap.passengers
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES qap.cities(id);
 9   ALTER TABLE ONLY qap.passengers DROP CONSTRAINT city_fk;
       qap          postgres    false    211    3185    210            }           2606    24671    airports city_fk    FK CONSTRAINT     j   ALTER TABLE ONLY qap.airports
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES qap.cities(id);
 7   ALTER TABLE ONLY qap.airports DROP CONSTRAINT city_fk;
       qap          postgres    false    210    212    3185                       2606    24693 !   aircraft_passengers passengers_fk    FK CONSTRAINT     �   ALTER TABLE ONLY qap.aircraft_passengers
    ADD CONSTRAINT passengers_fk FOREIGN KEY (passenger_id) REFERENCES qap.passengers(id);
 H   ALTER TABLE ONLY qap.aircraft_passengers DROP CONSTRAINT passengers_fk;
       qap          postgres    false    3187    214    211               =   x��� !��q1���e���ǉ��r���)lA*-��؊�p����x�Q͙�!���	�         s   x�u�A� ��5s
.�����qiIZL@��ec��.ߟ/y��K��i��1�)K]_{j���sI�1�颊:���D�M�qk6x��w>��G(���{���� �/�[ƌ0 p �3<�         -   x�3�4�2�4bS.cNc.NC 6�2�̀�@�)����� }�l         �   x�u�=�0@��>E6&*��Ӱ�ƨ����jo�'X��=��YY��r���CK�TV-�C�D�6ʙ�����z7�\�!K*�t8�^�����D�qo�>�x}ѴT�@�I�N��0��^E=�ޓ�?��R!         c   x��M
� ��7�)j���`l�)!���7�>�ŷi���ܰ1�1��:Ϻ�(����(��}�Ŝ��C�!�l�S�tlU|�Ȟm��ED?��.         �   x�5�Mn� ���.T����� u��I-߾C�A��������{(vTR+%��4Hh�k*��[��&�Yn[(s-�����Ԇf�9��k�~`�y5�8B��a-'�x��b�)���#�X���iz������7i?t��i��ѫt"�a��kn!aOḌx�Sl����,yE�|q!M��dxU'��6~O���v1Ig-uָ��Ξ�����QO~!� �eX     